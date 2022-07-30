import 'package:happylocate_app/core/entity/entity.dart';
import 'package:happylocate_app/features/inventory_management/domain/entities/dimesion.dart';
import 'package:happylocate_app/features/inventory_management/domain/entities/item_type.dart';
import 'package:uuid/uuid.dart';

class InventoryItem extends Entity {
  final String id;
  final String name;
  final Dimension dimension;
  final ItemType itemType;
  final int quantity;

  bool get inStock => quantity > 0;

  InventoryItem({
    required this.id,
    required this.name,
    required this.dimension,
    required this.itemType,
    required this.quantity,
  });

  factory InventoryItem.empty() {
    return InventoryItem(
      id: const Uuid().v4(),
      name: '',
      dimension: Dimension.zero(),
      itemType: ItemType.fragile,
      quantity: 1,
    );
  }

  @override
  String toString() {
    return 'InventoryItem(id: $id, name: $name, dimension: $dimension, itemType: $itemType, quantity: $quantity)';
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
    return name.hashCode ^ dimension.hashCode ^ itemType.hashCode;
  }

  InventoryItem copyWith({
    String? id,
    String? name,
    Dimension? dimension,
    ItemType? itemType,
    int? quantity,
  }) {
    return InventoryItem(
      id: id ?? this.id,
      name: name ?? this.name,
      dimension: dimension ?? this.dimension,
      itemType: itemType ?? this.itemType,
      quantity: quantity ?? this.quantity,
    );
  }
}
