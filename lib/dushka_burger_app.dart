import 'package:dushka_burger/core/utils/app_locale.dart';
import 'package:dushka_burger/features/menu/presentation/views/category_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';



class DushkaBurgerApp extends StatelessWidget {
  const DushkaBurgerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        AppLocale.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en', 'US'), Locale('ar', 'EG')],
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const CategoryView(),
    );
  }
}
