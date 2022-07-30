import 'package:dartz/dartz.dart';
import 'package:happylocate_app/core/errors/failure.dart';
import 'package:happylocate_app/core/usecase/usecase.dart';
import 'package:happylocate_app/features/inventory_management/domain/entities/inventory_item.dart';
import 'package:happylocate_app/features/inventory_management/domain/repositories/inventory_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class DeleteInventoryItem
    implements Usecase<List<InventoryItem>, DeleteInventoryItemParams> {
  final InventoryRepository repository;
  DeleteInventoryItem({
    required this.repository,
  });
  @override
  Future<Either<Failure, List<InventoryItem>>> call(
    DeleteInventoryItemParams params,
  ) async {
    return repository.deleteInventoryItem(params.item);
  }
}

class DeleteInventoryItemParams {
  final InventoryItem item;

  DeleteInventoryItemParams({required this.item});
}
