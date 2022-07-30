import 'package:happylocate_app/core/model/model.dart';
import 'package:happylocate_app/features/inventory_management/data/models/dimension_model.dart';
import 'package:happylocate_app/features/inventory_management/domain/entities/dimesion.dart';
import 'package:happylocate_app/features/inventory_management/domain/entities/inventory_item.dart';
import 'package:happylocate_app/features/inventory_management/domain/entities/item_type.dart';

class InventoryItemModel extends Model<InventoryItem> {
  final String? name;
  final DimensionModel? dimension;
  final String? itemType;
  final int? quantity;

  InventoryItemModel({
    this.name,
    this.dimension,
    this.itemType,
    this.quantity,
  });

  factory InventoryItemModel.fromDomain(InventoryItem entity) {
    return InventoryItemModel(
      name: entity.name,
      dimension: DimensionModel.fromDomain(entity.dimension),
      itemType: entity.itemType.name,
      quantity: entity.quantity,
    );
  }

  factory InventoryItemModel.fromJson(Map<String, dynamic> json) {
    return InventoryItemModel(
      name: json['name'] as String?,
      dimension: json['dimension'] != null
          ? DimensionModel.fromJson(json['dimension'] as Map<String, dynamic>)
          : null,
      itemType: json['itemType'] as String?,
      quantity: json['quantity'] as int?,
    );
  }

  @override
  InventoryItem toDomain() {
    return InventoryItem(
      name: name!,
      dimension: dimension?.toDomain() ?? Dimension.zero(),
      itemType: itemTypeFromString(itemType!),
      quantity: quantity ?? 0,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'dimension': dimension?.toJson(),
      'itemType': itemType,
      'quantity': quantity,
    };
  }
}
