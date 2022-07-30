import 'package:flutter/material.dart';
import 'package:happylocate_app/core/widgets/hl_scaffold.dart';
import 'package:happylocate_app/features/inventory_management/domain/entities/inventory_item.dart';
import 'package:happylocate_app/features/inventory_management/domain/entities/item_type.dart';
import 'package:happylocate_app/features/inventory_management/presentation/widgets/inventory_form.dart';

class EditInventoryItemForm extends StatefulWidget {
  final InventoryItem item;
  final Function(InventoryItem) onAdd;
  const EditInventoryItemForm({
    Key? key,
    required this.item,
    required this.onAdd,
  }) : super(key: key);

  @override
  State<EditInventoryItemForm> createState() => EditInventoryItemFormState();
}

class EditInventoryItemFormState extends State<EditInventoryItemForm> {
  late InventoryItem _item;

  @override
  void initState() {
    _item = widget.item;
    super.initState();
  }

  void onNameChanged(String name) {
    setState(() {
      _item = _item.copyWith(name: name);
    });
  }

  void onDimensionHeightChanged(String height) {
    setState(() {
      _item = _item.copyWith(
        dimension: _item.dimension.copyWith(height: int.parse(height)),
      );
    });
  }

  void onDimensionWidthChanged(String width) {
    setState(() {
      _item = _item.copyWith(
        dimension: _item.dimension.copyWith(width: int.parse(width)),
      );
    });
  }

  void onQtyChanged(int? qty) {
    setState(() {
      _item = _item.copyWith(quantity: qty);
    });
  }

  void onItemTypeChanged(ItemType? type) {
    setState(() {
      _item = _item.copyWith(itemType: type);
    });
  }

  @override
  Widget build(BuildContext context) {
    return HlScaffold(
      appBarTitle: 'Edit Item',
      page: Container(
        margin: const EdgeInsets.symmetric(vertical: 12),
        child: ListView(
          children: [
            InventoryForm(
              item: _item,
              onNameChanged: onNameChanged,
              onDimensionHeightChanged: onDimensionHeightChanged,
              onDimensionWidthChanged: onDimensionWidthChanged,
              onQtyChanged: onQtyChanged,
              onItemTypeChanged: onItemTypeChanged,
              onEditComplete: widget.onAdd,
            ),
          ],
        ),
      ),
    );
  }
}
