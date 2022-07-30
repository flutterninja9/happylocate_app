import 'package:happylocate_app/core/entity/entity.dart';
import 'package:happylocate_app/features/inventory_management/domain/entities/dimesion.dart';
import 'package:happylocate_app/features/inventory_management/domain/entities/item_type.dart';

class InventoryItem extends Entity {
  final String name;
  final Dimension dimension;
  final ItemType itemType;
  final int quantity;

  bool get inStock => quantity > 0;

  InventoryItem({
    required this.name,
    required this.dimension,
    required this.itemType,
    required this.quantity,
  });

  @override
  String toString() {
    return 'InventoryItem(name: $name, dimension: $dimension, itemType: $itemType, quantity: $quantity)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is InventoryItem &&
        other.name == name &&
        other.dimension == dimension &&
        other.itemType == itemType;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        dimension.hashCode ^
        itemType.hashCode ^
        quantity.hashCode;
  }
}
