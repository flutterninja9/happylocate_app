import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:happylocate_app/core/app/happy_locate_app.dart';
import 'package:happylocate_app/di.dart';

Future<void> main() async {
  final bindings = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: bindings);
  configureDependencies();
  FlutterNativeSplash.remove();
  runApp(const HappyLocateApp());
}
