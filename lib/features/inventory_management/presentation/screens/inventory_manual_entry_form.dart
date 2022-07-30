import 'package:flutter/material.dart';
import 'package:happylocate_app/core/app/typography.dart';
import 'package:happylocate_app/core/extensions/build_context.dart';
import 'package:happylocate_app/core/widgets/hl_scaffold.dart';
import 'package:happylocate_app/features/inventory_management/domain/entities/inventory_item.dart';
import 'package:happylocate_app/features/inventory_management/domain/entities/item_type.dart';

class InventoryManualEntryForm extends StatefulWidget {
  final Function(InventoryItem) onAdd;
  const InventoryManualEntryForm({
    Key? key,
    required this.onAdd,
  }) : super(key: key);

  @override
  State<InventoryManualEntryForm> createState() =>
      _InventoryManualEntryFormState();
}

class _InventoryManualEntryFormState extends State<InventoryManualEntryForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  InventoryItem _item = InventoryItem.empty();
  @override
  Widget build(BuildContext context) {
    return HlScaffold(
      appBarTitle: 'Add manually',
      page: Container(
        margin: const EdgeInsets.symmetric(vertical: 12),
        child: ListView(
          children: [
            Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    key: const ValueKey('name'),
                    validator: (value) {
                      if (value != null && value.isNotEmpty) {
                        return null;
                      }
                      return 'Please enter a name';
                    },
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 8),
                      border: OutlineInputBorder(),
                      label: Text('Name'),
                      prefixIcon: Icon(Icons.emoji_objects),
                    ),
                    onChanged: (name) {
                      _item = _item.copyWith(name: name);
                    },
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
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value != null && value.isNotEmpty) {
                                    return null;
                                  }
                                  return 'Not valid';
                                },
                                decoration: const InputDecoration(
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 8),
                                  border: OutlineInputBorder(),
                                  label: Text('Height ft'),
                                  prefixIcon: Icon(Icons.height),
                                ),
                                onChanged: (height) {
                                  _item = _item.copyWith(
                                    dimension: _item.dimension
                                        .copyWith(height: int.parse(height)),
                                  );
                                },
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: TextFormField(
                                key: const ValueKey('width'),
                                validator: (value) {
                                  if (value != null && value.isNotEmpty) {
                                    return null;
                                  }
                                  return 'Not valid';
                                },
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 8),
                                  border: OutlineInputBorder(),
                                  label: Text('Width ft'),
                                  prefixIcon: Icon(Icons.wb_iridescent_sharp),
                                ),
                                onChanged: (width) {
                                  _item = _item.copyWith(
                                    dimension: _item.dimension
                                        .copyWith(width: int.parse(width)),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: DropdownButtonFormField<int>(
                          value: _item.quantity,
                          icon: const Icon(
                            Icons.keyboard_arrow_down_outlined,
                          ),
                          items: List.generate(100, (index) => index)
                              .map((index) => DropdownMenuItem(
                                    value: index,
                                    child: Text(
                                      "Qty: $index",
                                      style: subtitle2,
                                    ),
                                  ))
                              .toList(),
                          onChanged: (qty) {
                            setState(() {
                              _item = _item.copyWith(quantity: qty);
                            });
                          },
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
                      value: _item.itemType,
                      items: ItemType.values
                          .map((e) =>
                              DropdownMenuItem(value: e, child: Text(e.name)))
                          .toList(),
                      onChanged: (type) {
                        setState(() {
                          _item = _item.copyWith(itemType: type);
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 18),
                  SizedBox(
                    height: 40,
                    width: context.width,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (formKey.currentState?.validate() ?? false) {
                          await widget.onAdd(_item);
                          Navigator.of(context).pop();
                        }
                      },
                      child: const Text('Save'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
