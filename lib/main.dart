import 'package:flutter/material.dart';
import 'package:weather_app/utils/app_palette.dart';
import 'package:weather_app/utils/routes.dart';
import 'package:weather_app/view/home_view.dart';
import 'package:weather_app/view/location_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        fontFamily: 'Dangrek',
        colorScheme: ColorScheme.fromSeed(seedColor: AppPalette.primary),
        useMaterial3: true,
      ),
      navigatorKey: navigatorKey,
      routes: {
        RoutesApp.HOME: (context) => const HomeView(),
        RoutesApp.LOCATION: (context) => const LocationView(),
      },
      initialRoute: RoutesApp.HOME,
    );
  }
}
