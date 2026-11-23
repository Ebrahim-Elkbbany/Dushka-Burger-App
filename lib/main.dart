import 'package:dushka_burger/core/di/service_locator.dart' as di;
import 'package:dushka_burger/dushka_burger_app.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const DushkaBurgerApp());
}
