import 'package:flutter/material.dart';
import 'package:happylocate_app/core/app/typography.dart';

/// BaseWidget for all the app screens.
class HlScaffold extends StatelessWidget {
  final String? appBarTitle;
  final Widget? page;
  final bool applyDefaultPadding;

  static const kMinPadding = 8.0;
  const HlScaffold({
    Key? key,
    this.appBarTitle,
    this.applyDefaultPadding = true,
    required this.page,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarTitle != null
          ? AppBar(title: Text(appBarTitle!, style: headline))
          : null,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: applyDefaultPadding ? kMinPadding : 0,
        ),
        child: page,
      ),
    );
  }
}
