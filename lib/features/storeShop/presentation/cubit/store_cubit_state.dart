part of 'store_cubit_cubit.dart';

sealed class StoreState extends Equatable {
  const StoreState();

  @override
  List<Object> get props => [];
}

class StoreLoading extends StoreState {
  const StoreLoading();
}

class StoreLoaded extends StoreState {
   final List<StoreEntity> stores;
  final String searchQuery;
  final bool openOnly;
  final SortOption sortOption;
  const StoreLoaded({
    required this.stores,
    required this.searchQuery,
    required this.openOnly,
    required this.sortOption,
  });

  @override
  List<Object> get props => [stores, searchQuery, openOnly, sortOption];
}

class StoreError extends StoreState {
  final String message;

  const StoreError(this.message);

  @override
  List<Object> get props => [message];
}

