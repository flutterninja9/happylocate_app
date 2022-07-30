import 'package:flutter/material.dart';
import 'package:happylocate_app/core/app/color_pallete.dart';
import 'package:happylocate_app/core/app/typography.dart';
import 'package:happylocate_app/core/extensions/build_context.dart';
import 'package:happylocate_app/features/inventory_management/domain/entities/inventory_item.dart';
import 'package:happylocate_app/features/inventory_management/presentation/widgets/inventory_listtile.dart';

class InventoryView extends StatefulWidget {
  final List<InventoryItem> items;
  final Function() onCheckout;
  final Function(InventoryItem) onItemRemoved;
  final Function(InventoryItem, int) onQuantityChanged;

  const InventoryView({
    Key? key,
    required this.items,
    required this.onCheckout,
    required this.onItemRemoved,
    required this.onQuantityChanged,
  }) : super(key: key);

  @override
  State<InventoryView> createState() => _InventoryViewState();
}

class _InventoryViewState extends State<InventoryView> {
  double scrollPosition = 0.0;

  bool get showBottomsheet => scrollPosition == 0.0;
  int get totalItems => widget.items.length;

  /// Total quantity of items in the inventory.
  int totalObjects() =>
      widget.items.fold(0, (sum, item) => sum + item.quantity);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        NotificationListener<ScrollNotification>(
          onNotification: (_) {
            setState(() {
              scrollPosition = _.metrics.pixels;
            });
            return true;
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildListDelegate.fixed(
                    [
                      Row(
                        children: [
                          Text("$totalItems Items", style: headline),
                          const Spacer(),
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text("Add"),
                          ),
                        ],
                      ),
                      const Divider(color: dividerColor, thickness: 1),
                    ],
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final item = widget.items[index];
                      return InventoryListile(
                        item: item,
                        onItemRemoved: widget.onItemRemoved,
                        onQuantityChanged: widget.onQuantityChanged,
                      );
                    },
                    childCount: widget.items.length,
                  ),
                ),
              ],
            ),
          ),
        ),
        AnimatedPositioned(
          duration: const Duration(milliseconds: 100),
          bottom: showBottomsheet ? 0 : -context.height * 0.2,
          child: Container(
            height: context.height * 0.2,
            width: context.width,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: const BoxDecoration(
              color: canvasColor,
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.22),
                  blurRadius: 15,
                  spreadRadius: 10,
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Subtotal",
                      style: subtitle1,
                    ),
                    const Spacer(),
                    Text(
                      "${totalObjects()} objects",
                      textAlign: TextAlign.end,
                      style: headline,
                    ),
                  ],
                ),
                const Spacer(),
                SizedBox(
                  height: 40,
                  width: context.width,
                  child: ElevatedButton(
                    onPressed: widget.onCheckout,
                    child: const Text("Checkout"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
