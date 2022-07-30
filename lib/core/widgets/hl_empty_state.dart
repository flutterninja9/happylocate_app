import 'package:flutter/material.dart';
import 'package:happylocate_app/core/app/res.dart';
import 'package:happylocate_app/core/app/typography.dart';

class HlEmptyState extends StatelessWidget {
  final String? label;
  final String? actionBtnLabel;
  final VoidCallback? onTapAction;

  const HlEmptyState({
    Key? key,
    this.label,
    this.onTapAction,
    this.actionBtnLabel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 150,
            child: Image.asset(Res.emptyStateImage),
          ),
          const SizedBox(height: 20),
          if (label != null)
            Text(
              label!,
              style: body1,
            ),
          const SizedBox(height: 8),
          if (actionBtnLabel != null)
            SizedBox(
              height: 40,
              width: 140,
              child: ElevatedButton(
                onPressed: onTapAction,
                child: Text(
                  actionBtnLabel!,
                  style: subtitle2.copyWith(color: Colors.white),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
