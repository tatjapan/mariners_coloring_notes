import 'package:flutter/material.dart';
import 'package:mariners_coloring_notes/pages/select_image_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mariners_coloring_notes/services/app_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: [
        Locale('en'),
        Locale('ja'),
        Locale('es'),
      ],
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      // Returns a locale which will be used by the app
      localeResolutionCallback: (locale, supportedLocales) {
        // Check if the current device locale is supported

        //forの下ifに手動で言語を変えるロジックいれる

        for (var supportedLocale in supportedLocales) {
//          if (supportedLocale.languageCode == locale.languageCode) {
//            return supportedLocale;
//          }
          if (supportedLocale.languageCode == locale.languageCode ||
              supportedLocale.countryCode == locale.countryCode) {
            return supportedLocale;
          }
        }
        // If the locale of the device is not supported, use the first one
        // from the list (English, in this case).
        return supportedLocales.first;
      },
      title: 'Mariners coloring note',
      home: SelectImagePage(),
    );
  }
}
