import 'package:darsak/core/utils/app_routes.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(DevicePreview(builder: (context) => const MyApp(), enabled: false));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
 locale: const Locale('ar'),
      supportedLocales: const [
        Locale('ar'),
        Locale('en'),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate, // ⚠️ Must include this for RTL
        GlobalCupertinoLocalizations.delegate,
      ],      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
      title: 'Darsak',
      theme: ThemeData(),
    );
  }
}
