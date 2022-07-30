import 'package:dartz/dartz.dart';
import 'package:happylocate_app/core/errors/failure.dart';
import 'package:happylocate_app/core/usecase/usecase.dart';
import 'package:happylocate_app/features/inventory_management/domain/entities/inventory_item.dart';
import 'package:happylocate_app/features/inventory_management/domain/repositories/inventory_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class GetInventoryItems implements Usecase<List<InventoryItem>, NoParams> {
  final InventoryRepository repository;
  GetInventoryItems({
    required this.repository,
  });

  @override
  Future<Either<Failure, List<InventoryItem>>> call(NoParams params) async {
    return repository.getInventoryItems();
  }
}
