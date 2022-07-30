import 'package:dartz/dartz.dart';
import 'package:happylocate_app/core/cache_service/exceptions.dart';
import 'package:happylocate_app/core/errors/failure.dart';
import 'package:happylocate_app/features/inventory_management/data/data_sources/inventory_local_data_source.dart';
import 'package:happylocate_app/features/inventory_management/data/models/inventory_item_model.dart';
import 'package:happylocate_app/features/inventory_management/domain/entities/inventory_failure.dart';
import 'package:happylocate_app/features/inventory_management/domain/entities/inventory_item.dart';
import 'package:happylocate_app/features/inventory_management/domain/repositories/inventory_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: InventoryRepository)
class InventoryRepositoryImpl implements InventoryRepository {
  final InventoryLocalDataSource localDataSource;

  InventoryRepositoryImpl({
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, List<InventoryItem>>> addInventoryItem(
    InventoryItem item,
  ) async {
    return await _safeCallback(() async {
      final result = await localDataSource
          .addInventoryItem(InventoryItemModel.fromDomain(item));
      return Right(result.map((model) => model.toDomain()).toList());
    });
  }

  @override
  Future<Either<Failure, List<InventoryItem>>> deleteInventoryItem(
    InventoryItem item,
  ) async {
    return await _safeCallback(() async {
      final result = await localDataSource
          .deleteInventoryItem(InventoryItemModel.fromDomain(item));
      return Right(result.map((model) => model.toDomain()).toList());
    });
  }

  @override
  Future<Either<Failure, List<InventoryItem>>> getInventoryItems() async {
    return await _safeCallback(() async {
      final List<InventoryItemModel> models =
          await localDataSource.getInventoryItems();
      return Right(models.map((model) => model.toDomain()).toList());
    });
  }

  @override
  Future<Either<Failure, InventoryItem>> updateInventoryItem(
    InventoryItem item,
  ) async {
    return await _safeCallback(() async {
      final InventoryItemModel model = await localDataSource
          .updateInventoryItem(InventoryItemModel.fromDomain(item));
      return Right(model.toDomain());
    });
  }

  Future<Either<Failure, T>> _safeCallback<T>(
    Future<Either<Failure, T>> Function() callback,
  ) async {
    try {
      return await callback();
    } on CacheException catch (e) {
      return Left(InventoryFailure(e.message));
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }
}
