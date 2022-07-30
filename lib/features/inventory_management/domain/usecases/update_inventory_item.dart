import 'package:dartz/dartz.dart';
import 'package:happylocate_app/core/errors/failure.dart';
import 'package:happylocate_app/core/usecase/usecase.dart';
import 'package:happylocate_app/features/inventory_management/domain/entities/inventory_item.dart';
import 'package:happylocate_app/features/inventory_management/domain/repositories/inventory_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class UpdateInventoryItem
    implements Usecase<InventoryItem, UpdateInventoryItemParams> {
  final InventoryRepository repository;
  UpdateInventoryItem({
    required this.repository,
  });
  @override
  Future<Either<Failure, InventoryItem>> call(
    UpdateInventoryItemParams params,
  ) async {
    return repository.updateInventoryItem(params.item);
  }
}

class UpdateInventoryItemParams {
  final InventoryItem item;

  UpdateInventoryItemParams({required this.item});
}
