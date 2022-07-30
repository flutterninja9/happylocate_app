import 'package:happylocate_app/features/inventory_management/data/models/dimension_model.dart';
import 'package:happylocate_app/features/inventory_management/data/models/inventory_item_model.dart';

List<InventoryItemModel> tempInventoryData = [
  InventoryItemModel(
    name: 'Dinning Table',
    dimension: DimensionModel(2.5, 5),
    itemType: 'heavy',
    quantity: 1,
  ),
  InventoryItemModel(
    name: 'Sony Television',
    dimension: DimensionModel(2.5, 5),
    itemType: 'fragile',
    quantity: 6,
  ),
  InventoryItemModel(
    name: 'Item 3',
    dimension: DimensionModel(5.0, 5.0),
    itemType: 'fragile',
    quantity: 1,
  ),
  InventoryItemModel(
    name: 'Item 4',
    dimension: DimensionModel(12.0, 1.0),
    itemType: 'heavy',
    quantity: 15,
  ),
  InventoryItemModel(
    name: 'Item 5',
    dimension: DimensionModel(16.0, 11.0),
    itemType: 'fragile',
    quantity: 21,
  ),
];
