import 'package:dartz/dartz.dart';
import 'package:happylocate_app/core/errors/failure.dart';
import 'package:happylocate_app/features/inventory_management/domain/entities/inventory_item.dart';

abstract class InventoryRepository {
  /// Responsible for saving the passed in [InventoryItem]
  /// and returns the updated [InventoryItem] if successful.
  Future<Either<Failure, List<InventoryItem>>> addInventoryItem(
      InventoryItem item);

  /// Responsible for deleting the passed in [InventoryItem]
  Future<Either<Failure, List<InventoryItem>>> deleteInventoryItem(
      InventoryItem item);

  /// Responsible for updating the passed in [InventoryItem]
  Future<Either<Failure, InventoryItem>> updateInventoryItem(
    InventoryItem item,
  );

  /// Responsible for retrieving all the [InventoryItem]s
  Future<Either<Failure, List<InventoryItem>>> getInventoryItems();
}
