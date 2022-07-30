import 'package:happylocate_app/features/inventory_management/data/models/inventory_item_model.dart';

/// Keys for the cache
/// This is a list of keys that are used to store the data in the cache
const String kInventoryItemsKey = 'inventory_items';

/// Interface for the local data source
/// throws [CacheException]
abstract class InventoryLocalDataSource {
  /// Responsible for saving the passed in [InventoryItemModel]
  Future<List<InventoryItemModel>> addInventoryItem(InventoryItemModel item);

  /// Responsible for deleting the passed in [InventoryItemModel]
  Future<List<InventoryItemModel>> deleteInventoryItem(InventoryItemModel item);

  /// Responsible for updating the passed in [InventoryItemModel]
  Future<InventoryItemModel> updateInventoryItem(
    InventoryItemModel item,
  );

  /// Responsible for retrieving all the [InventoryItemModel]s
  Future<List<InventoryItemModel>> getInventoryItems();
}
