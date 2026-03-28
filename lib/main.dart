import 'package:flutter/material.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:hipoteca/app/domain/mortgage_provider.dart';
import 'package:hipoteca/app/presentation/views/home/home.dart';
import 'package:hipoteca/src/styles/colors/colors.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // MobileAds.instance.initialize();
  runApp(
    ChangeNotifierProvider(
      create: (_) => MortgageProvider(),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mortgage Calculator',
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: kBackgroundColor,
        primaryColor: kPrimaryColor,
        textSelectionTheme: TextSelectionThemeData(cursorColor: kPrimaryColor),
        textTheme: TextTheme(
          displayLarge: TextStyle(color: kTextColor),
          displayMedium: TextStyle(color: kTextColor),
          displaySmall: TextStyle(color: kTextColor),
          headlineMedium: TextStyle(color: kTextColor),
          headlineSmall: TextStyle(color: kTextColor, fontSize: 26.0),
          titleLarge: TextStyle(color: kTextColor, fontSize: 20.0),
          titleMedium: TextStyle(color: kTextColor, fontSize: 16.0),
          titleSmall: TextStyle(color: kTextColor, fontSize: 14.0),
          bodyLarge: TextStyle(color: kTextColor, fontSize: 16.0),
          bodyMedium: TextStyle(color: kTextColor, fontSize: 14.0),
        ),
      ),
      home: const HomeView(),
    );
  }
}
