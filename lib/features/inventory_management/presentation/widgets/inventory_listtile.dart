import 'package:flutter/material.dart';
import 'package:happylocate_app/core/app/color_pallete.dart';
import 'package:happylocate_app/core/app/typography.dart';
import 'package:happylocate_app/features/inventory_management/domain/entities/inventory_item.dart';

class InventoryListile extends StatelessWidget {
  final InventoryItem item;
  final Function(InventoryItem) onItemRemoved;
  final Function(InventoryItem, int) onQuantityChanged;

  const InventoryListile({
    Key? key,
    required this.item,
    required this.onItemRemoved,
    required this.onQuantityChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      key: ValueKey(item.id),
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 96,
                    width: 96,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  const SizedBox(width: 16),
                  SizedBox(
                    height: 96,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.name,
                              style: subtitle1,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              item.dimension.toString(),
                              style: caption,
                            ),
                            const SizedBox(height: 2),
                            Text(
                              item.itemType.name,
                              style: caption,
                            ),
                          ],
                        ),
                        if (item.inStock)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.done,
                                color: secondaryColor,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                "In Stock",
                                style: caption,
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 56,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 4.0,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      border: Border.all(
                        color: Colors.grey,
                        style: BorderStyle.solid,
                      ),
                    ),
                    child: DropdownButton<int>(
                      value: item.quantity,
                      icon: const Icon(
                        Icons.keyboard_arrow_down_outlined,
                      ),
                      underline: const SizedBox(),
                      items: List.generate(100, (index) => index)
                          .map((index) => DropdownMenuItem(
                                value: index,
                                child: Text(
                                  index.toString(),
                                  style: subtitle2,
                                ),
                              ))
                          .toList(),
                      onChanged: (qty) =>
                          onQuantityChanged(item, qty ?? item.quantity),
                    ),
                  ),
                  TextButton(
                    onPressed: () => onItemRemoved(item),
                    child: Text(
                      'Remove',
                      style: caption,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const Divider(color: dividerColor, thickness: 1),
      ],
    );
  }
}
