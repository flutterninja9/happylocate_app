part of 'inventory_listing_bloc.dart';

@freezed
class InventoryListingEvent with _$InventoryListingEvent {
  const factory InventoryListingEvent.getInventory() = _GetInventory;
  // Works for adding an item as well
  const factory InventoryListingEvent.addItem(InventoryItem item) = _AddItem;
  const factory InventoryListingEvent.updateInventoryItemQty(
      InventoryItem item, int qty) = _UpdateInventoryItem;
  const factory InventoryListingEvent.deleteItem(InventoryItem item) =
      _DeleteItem;
}
