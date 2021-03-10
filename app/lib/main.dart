import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:app/global/color.dart';
import 'package:app/global/global.dart';
import 'package:app/injector/injector_base.dart';
import 'package:app/localizations.dart';
import 'package:app/pages/drawer_page/drawer_page.dart';

void main() async {
  bool isInDebugMode = environment == Environment.DEVELOPMENT;

  FlutterError.onError = (FlutterErrorDetails details) {
    if (isInDebugMode) {
      // In development mode simply print to console.
      FlutterError.dumpErrorToConsole(details);
    } else {
      // In production mode report to the application zone to report to
      // Crashlytics.
      Zone.current.handleUncaughtError(details.exception, details.stack);
    }
  };

  /* Resiger Dependency injections */
  Injector injector = Injector.appInstance;

  runZoned<Future<Null>>(() async {
    runApp(MyApp());
  }, onError: (error, stackTrace) async {
    // Whenever an error occurs, call the `reportCrash` function. This will send
    // Dart errors to our dev console or Crashlytics depending on the environment.
//    await FlutterCrashlytics().reportCrash(error, stackTrace, forceCrash: false);
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: [Locale("en"), Locale("vi")],
      localizationsDelegates: [
        AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      localeResolutionCallback:
          (Locale locale, Iterable<Locale> supportedLocales) {
        for (Locale supportedLocale in supportedLocales) {
          if (supportedLocale == null || locale == null)
            continue;

          var supportedCode = supportedLocale.languageCode ?? "";
          var code = locale.languageCode ?? "";

          if (supportedCode == code && code.isNotEmpty)
            return supportedLocale;
        }

        return supportedLocales.first ?? Configs.language;
      },
      onGenerateTitle: (BuildContext context) =>
          AppLocalizations.of(context).trans("app_name"),
      theme: ThemeData(
          primaryColor: AppColors.mainColor,
          textTheme: TextTheme(
              headline: const TextStyle(fontSize: 30.0, color: Colors.white),
              title: const TextStyle(fontSize: 20.0, color: Colors.white),
              body1: const TextStyle(fontSize: 18.0, color: Colors.black),
              body2: const TextStyle(fontSize: 16.0, color: Colors.black))),
      home: DrawerPage(),
    );
  }
}
