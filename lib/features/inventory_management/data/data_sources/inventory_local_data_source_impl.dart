import 'dart:convert';

import 'package:happylocate_app/core/cache_service/cache_service.dart';
import 'package:happylocate_app/core/cache_service/exceptions.dart';
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
  Future<List<InventoryItemModel>> addInventoryItem(
    InventoryItemModel item,
  ) async {
    if (item.quantity! > 0) {
      final List<InventoryItemModel> items = await getInventoryItems();
      for (int i = 0; i < items.length; i++) {
        final currentItem = items[i];
        if (currentItem.id == item.id) {
          items[i] = item;
          await cacheService.setData(
            kInventoryItemsKey,
            jsonEncode(items.map((model) => model.toJson()).toList()),
          );
          return items;
        }
      }

      items.add(item);
      await cacheService.setData(
        kInventoryItemsKey,
        jsonEncode(items.map((model) => model.toJson()).toList()),
      );

      return items;
    }
    return await deleteInventoryItem(item);
  }

  @override
  Future<List<InventoryItemModel>> deleteInventoryItem(
    InventoryItemModel item,
  ) async {
    final List<InventoryItemModel> items = await getInventoryItems();
    for (int i = 0; i < items.length; i++) {
      final currentItem = items[i];
      if (currentItem.id == item.id) {
        items.removeAt(i);
        await cacheService.setData(
          kInventoryItemsKey,
          jsonEncode(items.map((model) => model.toJson()).toList()),
        );
        return items;
      }
    }
    return items;
  }

  @override
  Future<List<InventoryItemModel>> getInventoryItems() async {
    try {
      final String jsonStr = await cacheService.getData(kInventoryItemsKey);
      final List jsonList = jsonDecode(jsonStr);
      return jsonList
          .map((json) =>
              InventoryItemModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } on CacheException {
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
