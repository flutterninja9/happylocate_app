import 'package:flutter/material.dart';
import 'package:happylocate_app/core/app/consts.dart';
import 'package:happylocate_app/core/app/typography.dart';
import 'package:happylocate_app/core/extensions/build_context.dart';
import 'package:happylocate_app/features/inventory_management/domain/entities/inventory_item.dart';
import 'package:happylocate_app/features/inventory_management/domain/entities/item_type.dart';

class InventoryForm extends StatefulWidget {
  final InventoryItem item;
  final Function(String) onNameChanged;
  final Function(String) onDimensionHeightChanged;
  final Function(String) onDimensionWidthChanged;
  final Function(int?) onQtyChanged;
  final Function(ItemType?) onItemTypeChanged;
  final Function(InventoryItem) onEditComplete;

  const InventoryForm({
    Key? key,
    required this.item,
    required this.onNameChanged,
    required this.onDimensionHeightChanged,
    required this.onDimensionWidthChanged,
    required this.onQtyChanged,
    required this.onItemTypeChanged,
    required this.onEditComplete,
  }) : super(key: key);

  @override
  State<InventoryForm> createState() => _InventoryFormState();
}

class _InventoryFormState extends State<InventoryForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  late final TextEditingController nameController;
  late final TextEditingController heightController;
  late final TextEditingController widthController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController.fromValue(
      TextEditingValue(text: widget.item.name),
    );

    heightController = TextEditingController.fromValue(
      TextEditingValue(text: widget.item.dimension.height.toString()),
    );

    widthController = TextEditingController.fromValue(
      TextEditingValue(text: widget.item.dimension.width.toString()),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    heightController.dispose();
    widthController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            key: const ValueKey('name'),
            controller: nameController,
            validator: (value) {
              if (value != null && value.isNotEmpty) {
                return null;
              }
              return nameValidationMessage;
            },
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 8),
              border: OutlineInputBorder(),
              label: Text('Name'),
              prefixIcon: Icon(Icons.emoji_objects),
            ),
            onChanged: widget.onNameChanged,
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                flex: 3,
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        key: const ValueKey('height'),
                        controller: heightController,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value != null && value.isNotEmpty) {
                            return null;
                          }
                          return dimesionValidationMessage;
                        },
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 8),
                          border: OutlineInputBorder(),
                          label: Text('Height ft'),
                          prefixIcon: Icon(Icons.height),
                        ),
                        onChanged: widget.onDimensionHeightChanged,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextFormField(
                        key: const ValueKey('width'),
                        controller: widthController,
                        validator: (value) {
                          if (value != null && value.isNotEmpty) {
                            return null;
                          }
                          return dimesionValidationMessage;
                        },
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 8),
                          border: OutlineInputBorder(),
                          label: Text('Width ft'),
                          prefixIcon: Icon(Icons.wb_iridescent_sharp),
                        ),
                        onChanged: widget.onDimensionWidthChanged,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: DropdownButtonFormField<int>(
                  value: widget.item.quantity,
                  icon: const Icon(
                    Icons.keyboard_arrow_down_outlined,
                  ),
                  items: List.generate(100, (index) => index)
                      .map((index) => DropdownMenuItem(
                            key: ValueKey('number $index'),
                            value: index,
                            child: Text(
                              "Qty: $index",
                              style: subtitle2,
                            ),
                          ))
                      .toList(),
                  onChanged: widget.onQtyChanged,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            key: UniqueKey(),
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
              border: Border.all(
                color: Colors.grey,
                style: BorderStyle.solid,
              ),
            ),
            child: DropdownButtonFormField<ItemType>(
              value: widget.item.itemType,
              items: ItemType.values
                  .map((e) => DropdownMenuItem(
                      key: ValueKey('type ${e.name}'),
                      value: e,
                      child: Text(e.name)))
                  .toList(),
              onChanged: widget.onItemTypeChanged,
            ),
          ),
          const SizedBox(height: 18),
          SizedBox(
            height: 40,
            width: context.width,
            child: ElevatedButton(
              onPressed: () async {
                if (formKey.currentState?.validate() ?? false) {
                  await widget.onEditComplete(widget.item);
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Save'),
            ),
          ),
        ],
      ),
    );
  }
}
