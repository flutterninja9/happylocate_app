import 'package:flutter/material.dart';
import 'package:happylocate_app/core/app/color_pallete.dart';
import 'package:happylocate_app/core/app/typography.dart';
import 'package:happylocate_app/features/inventory_management/presentation/screens/inventory_home_screen.dart';

class HappyLocateApp extends StatelessWidget {
  const HappyLocateApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Happy locate',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: primaryColor),
        canvasColor: canvasColor,
        scaffoldBackgroundColor: canvasColor,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(primaryColor),
            textStyle: MaterialStateProperty.all(subtitle2),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(primaryColor),
          ),
        ),
      ),
      home: const InventoryHomescreen(),
    );
  }
}
