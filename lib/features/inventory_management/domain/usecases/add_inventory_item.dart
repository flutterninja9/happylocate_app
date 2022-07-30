import 'package:dartz/dartz.dart';
import 'package:happylocate_app/core/errors/failure.dart';
import 'package:happylocate_app/core/usecase/usecase.dart';
import 'package:happylocate_app/features/inventory_management/domain/entities/inventory_item.dart';
import 'package:happylocate_app/features/inventory_management/domain/repositories/inventory_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class AddInventoryItem implements Usecase<Unit, AddInventoryItemParams> {
  final InventoryRepository repository;
  AddInventoryItem({
    required this.repository,
  });
  @override
  Future<Either<Failure, Unit>> call(AddInventoryItemParams params) async {
    return repository.addInventoryItem(params.item);
  }
}

class AddInventoryItemParams {
  final InventoryItem item;

  AddInventoryItemParams({required this.item});
}
