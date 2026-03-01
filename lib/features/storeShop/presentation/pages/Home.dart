import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technical_assignment/core/DI/injection.dart';
import 'package:technical_assignment/features/storeShop/domain/usecases/get_stores.dart';
import 'package:technical_assignment/features/storeShop/presentation/cubit/sort_option.dart';
import 'package:technical_assignment/features/storeShop/presentation/cubit/store_cubit_cubit.dart';
import 'package:technical_assignment/features/storeShop/presentation/widgets/store_card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => StoreCubit(getIt<GetStores>())..fetchStores(),
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              "Stores",
              style: TextStyle(
                color: Color(0xFFFFD369),
                fontWeight: FontWeight.bold,
              ),
            ),
            backgroundColor: const Color(0xFF222831),
          ),
          // backgroundColor: const Color.fromARGB(255, 245, 199, 93),
          body: BlocBuilder<StoreCubit, StoreState>(
            builder: (context, state) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 8.0,
                      right: 8.0,
                      top: 12.0,
                      bottom: 4.0,
                    ),

                    child: TextField(
                      onChanged: (value) =>
                          context.read<StoreCubit>().setSearchQuery(value),
                      decoration: InputDecoration(
                        hintText: "Search stores...",
                        prefixIcon: Icon(Icons.search),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF393E46),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFFFD369),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                      vertical: 4.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Switch(
                              value: state is StoreLoaded
                                  ? state.openOnly
                                  : false,
                              onChanged: (value) {
                                context.read<StoreCubit>().setOpenOnly(value);
                              },
                              activeThumbColor: Color(0xFFFFD369),
                              activeTrackColor: Color(0xFF393E46),
                            ),
                            const Text("Open Only"),
                          ],
                        ),
                        PopupMenuButton<SortOption>(
                          onSelected: (value) {
                            context.read<StoreCubit>().setSortOption(value);
                            FocusScope.of(context).unfocus();
                          },
                          itemBuilder: (context) => [
                            PopupMenuItem(
                              value: SortOption.none,
                              child: Text("Default"),
                            ),
                            PopupMenuItem(
                              value: SortOption.eta,
                              child: Text("ETA"),
                            ),
                            PopupMenuItem(
                              value: SortOption.minimumOrder,
                              child: Text("Minimum Order"),
                            ),
                          ],
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                state is StoreLoaded
                                    ? state.sortOption.label
                                    : "Default",
                              ),
                              Icon(Icons.arrow_drop_down),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Builder(
                      builder: (_) {
                        if (state is StoreLoading) {
                          return Center(child: CircularProgressIndicator(color: Color(0xFF222831),));
                        }
                        if (state is StoreLoaded) {
                          if (state.stores.isEmpty) {
                            return Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.store_mall_directory_outlined,
                                    size: 60,
                                    color: Color(0xFF222831),
                                  ),
                                  SizedBox(height: 12),
                                  Text(
                                    "No stores found",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    "Try adjusting your search or filters",
                                    style: TextStyle(color: Color(0xFF222831)),
                                  ),
                                ],
                              ),
                            );
                          }
                          return ListView.builder(
                            itemCount: state.stores.length,
                            itemBuilder: (_, index) {
                              final store = state.stores[index];
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: StoreCard(store: store),
                              );
                            },
                          );
                        }
                        return SizedBox();
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
