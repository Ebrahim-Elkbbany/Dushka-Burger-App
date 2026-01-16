import 'package:dushka_burger/core/utils/app_locale.dart';
import 'package:dushka_burger/features/menu/presentation/views/category_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class DushkaBurgerApp extends StatelessWidget {
  const DushkaBurgerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        AppLocale.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en', 'US'), Locale('ar', 'EG')],
      locale: const Locale('ar', 'EG'),
      // localeResolutionCallback: (deviceLocale, supportedLocales) {
      //   if (deviceLocale != null) {
      //     for (var locale in supportedLocales) {
      //       if (locale.languageCode == deviceLocale.languageCode) {
      //         return deviceLocale;
      //       }
      //     }
      //   }
      //   return supportedLocales.first;
      // },
      theme: ThemeData(
        fontFamily: 'Cairo',
        scaffoldBackgroundColor: const Color(0xFFF9F3EE),
      ),
      home: const CategoryView(),
    );
  }
}
