import 'package:flutter/material.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hipoteca/app/domain/calcule.dart';
import 'package:hipoteca/app/presentation/views/home/home.dart';
import 'package:hipoteca/src/styles/colors/colors.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await dotenv.load(fileName: ".env");
  MobileAds.instance.initialize();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // final textTheme = Theme.of(context).textTheme;
    final calculeLogic = CalculeLogic();
    return MyInheretedWidget(
      calculeLogic: calculeLogic,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Hipoteca',
        theme: ThemeData(
          brightness: Brightness.light,
          scaffoldBackgroundColor: kBackgroundColor,
          // textTheme: GoogleFonts.ubuntuTextTheme(textTheme),
          textSelectionTheme:
              TextSelectionThemeData(cursorColor: kPrimaryColor),
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
        home: HomeView(),
      ),
    );
  }
}

class MyInheretedWidget extends InheritedWidget {
  final CalculeLogic calculeLogic;
  MyInheretedWidget({
    required super.child,
    required this.calculeLogic,
  });

  static MyInheretedWidget? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType();

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;
}
