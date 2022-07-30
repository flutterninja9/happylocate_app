part of 'inventory_listing_bloc.dart';

@freezed
class InventoryListingState with _$InventoryListingState {
  const factory InventoryListingState.loading() = _Loading;
  const factory InventoryListingState.loaded(List<InventoryItem> items) =
      _Loaded;
  const factory InventoryListingState.failure(String message) = _Failure;
}
