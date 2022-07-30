import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happylocate_app/core/app/color_pallete.dart';
import 'package:happylocate_app/core/app/typography.dart';
import 'package:happylocate_app/core/extensions/build_context.dart';
import 'package:happylocate_app/features/inventory_management/domain/entities/inventory_item.dart';
import 'package:happylocate_app/features/inventory_management/presentation/bloc/inventory_listing_bloc.dart';
import 'package:happylocate_app/features/inventory_management/presentation/screens/inventory_item_saved_screen.dart';

class InventoryView extends StatefulWidget {
  final List<InventoryItem> items;
  const InventoryView({Key? key, required this.items}) : super(key: key);

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
                      return Column(
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
                                      color: Colors.grey[200],
                                    ),
                                    const SizedBox(width: 16),
                                    SizedBox(
                                      height: 96,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
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
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 56,
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 4.0,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                        border: Border.all(
                                          color: Colors.grey,
                                          style: BorderStyle.solid,
                                        ),
                                      ),
                                      child: DropdownButton<int>(
                                        icon: const Icon(
                                          Icons.keyboard_arrow_down_outlined,
                                        ),
                                        underline: const SizedBox(),
                                        items: List.generate(
                                                100, (index) => index)
                                            .map((index) => DropdownMenuItem(
                                                  key: Key(index.toString()),
                                                  value: index,
                                                  child: Text(
                                                    index.toString(),
                                                    style: subtitle2,
                                                  ),
                                                ))
                                            .toList(),
                                        onChanged: (_) {},
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () => context
                                          .read<InventoryListingBloc>()
                                          .add(InventoryListingEvent.deleteItem(
                                              item)),
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
                      style: title,
                    ),
                  ],
                ),
                const Spacer(),
                SizedBox(
                  height: 40,
                  width: context.width,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const InventoryItemSavedScreen(),
                      ));
                    },
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
