import 'package:dushka_burger/core/theming/app_theme.dart';
import 'package:dushka_burger/core/utils/app_locale.dart';
import 'package:dushka_burger/features/menu/presentation/views/product_details_view.dart';
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
      locale: const Locale('en', 'US'),
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
      theme: AppThemes.light,
      home: const ProductDetailsView(),
    );
  }
}
