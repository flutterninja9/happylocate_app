import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:happylocate_app/core/cache_service/cache_service.dart';
import 'package:happylocate_app/features/inventory_management/data/data_sources/inventory_local_data_source.dart';
import 'package:happylocate_app/features/inventory_management/data/models/inventory_item_model.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: InventoryLocalDataSource)
class InventoryLocalDataSourceImpl implements InventoryLocalDataSource {
  final CacheService cacheService;
  InventoryLocalDataSourceImpl({
    required this.cacheService,
  });

  @override
  Future<Unit> addInventoryItem(
    InventoryItemModel item,
  ) async {
    return cacheService.setData(
      kInventoryItemsKey,
      jsonEncode(item.toJson()),
    );
  }

  @override
  Future<Unit> deleteInventoryItem(
    InventoryItemModel item,
  ) async {
    return cacheService.deleteData(kInventoryItemsKey);
  }

  @override
  Future<List<InventoryItemModel>> getInventoryItems() async {
    try {
      final String jsonStr = await cacheService.getData(kInventoryItemsKey);
      final List<Map<String, dynamic>> jsonList = jsonDecode(jsonStr);
      return jsonList.map((json) => InventoryItemModel.fromJson(json)).toList();
    } catch (e) {
      return [];
    }
  }

  @override
  Future<InventoryItemModel> updateInventoryItem(
    InventoryItemModel item,
  ) async {
    // TODO: For now add addInventoryItem() can be used to update the item
    throw UnimplementedError();
  }
}
