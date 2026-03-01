import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technical_assignment/features/storeShop/domain/entities/store.dart';
import 'package:technical_assignment/features/storeShop/domain/usecases/get_stores.dart';
import 'package:technical_assignment/features/storeShop/presentation/cubit/sort_option.dart';

part 'store_cubit_state.dart';

class StoreCubit extends Cubit<StoreState> {
  final GetStores getStores;

  List<StoreEntity> _allStores = [];
  String _searchQuery = '';
  bool _openOnly = false;
  SortOption _sortOption = SortOption.none;

  StoreCubit(this.getStores) : super(StoreLoading());

  void fetchStores() async {
    try {
      final result = await getStores();
      _allStores = result;
      emit(
        StoreLoaded(
          stores: _allStores,
          searchQuery: _searchQuery,
          openOnly: _openOnly,
          sortOption: _sortOption,
        ),
      );
    } catch (e) {
      emit(StoreError(e.toString()));
    }
  }

  void setSearchQuery(String query) {
    _searchQuery = query;
    _applyFilters();
  }

  void setOpenOnly(bool openOnly) {
    _openOnly = openOnly;
    _applyFilters();
  }

  void setSortOption(SortOption sortOption) {
    _sortOption = sortOption;
    _applyFilters();
  }

  void _applyFilters() {
    List<StoreEntity> filteredStores = [..._allStores];

    if (_searchQuery.isNotEmpty) {
      filteredStores = filteredStores
          .where(
            (store) =>
                store.name?.en?.toLowerCase().contains(_searchQuery.toLowerCase()) ?? false,
          )
          .toList();
    }

    if (_openOnly) {
      filteredStores = filteredStores.where((store) => store.availability == true).toList();
    }

    switch (_sortOption) {
      case SortOption.eta:
        filteredStores.sort((a, b) => a.estimatedDeliveryTime!.compareTo(b.estimatedDeliveryTime!));
        break;
      case SortOption.minimumOrder:
        filteredStores.sort((a, b) => a.minimumOrder!.amount.compareTo(b.minimumOrder!.amount));
        break;
      default:
        break;
    }

    emit(
      StoreLoaded(
        stores: filteredStores,
        searchQuery: _searchQuery,
        openOnly: _openOnly,
        sortOption: _sortOption,
      ),
    );
  }
}
