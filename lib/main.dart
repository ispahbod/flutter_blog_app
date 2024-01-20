import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_blog_app/gen/fonts.gen.dart';
import 'constants.dart';
import 'pages/splash_page.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blog Club',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          primary: Constants.primaryColor,
          onPrimary: Colors.white,
          background: Color(0xffFBFCFF),
          surface: Colors.white,
          onSurface: Constants.primaryTextColor,
          onBackground: Constants.primaryTextColor,
        ),
        useMaterial3: true,
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            textStyle: MaterialStateProperty.all(
              const TextStyle(
                fontSize: 16,
                color: Constants.primaryColor,
                fontWeight: FontWeight.w400,
                fontFamily: FontFamily.avenir,
              ),
            ),
          ),
        ),
        textTheme: const TextTheme(
            titleMedium: TextStyle(
              fontFamily: FontFamily.avenir,
              fontWeight: FontWeight.w500,
              color: Constants.secondryTextColor,
              fontSize: 18,
            ),
            titleSmall: TextStyle(
              fontFamily: FontFamily.avenir,
              fontWeight: FontWeight.w500,
              color: Constants.secondryTextColor,
              fontSize: 12,
            ),
            displayLarge: TextStyle(
              fontFamily: FontFamily.avenir,
              fontWeight: FontWeight.w600,
              color: Constants.primaryTextColor,
              fontSize: 26,
            ),
            displayMedium: TextStyle(
              fontFamily: FontFamily.avenir,
              fontWeight: FontWeight.w900,
              color: Colors.black,
              fontSize: 22,
            ),
            displaySmall: TextStyle(
              fontFamily: FontFamily.avenir,
              fontWeight: FontWeight.w500,
              color: Colors.black,
              fontSize: 13,
            ),
            bodyMedium: TextStyle(
              fontFamily: FontFamily.avenir,
              fontWeight: FontWeight.w500,
              color: Constants.secondryTextColor,
              fontSize: 14,
            ),
            bodyLarge: TextStyle(
              fontFamily: FontFamily.avenir,
              fontWeight: FontWeight.w600,
              color: Colors.white,
              fontSize: 18,
            ),
            bodySmall: TextStyle(
              fontFamily: FontFamily.avenir,
              fontWeight: FontWeight.w600,
              color: Constants.secondryTextColor,
              fontSize: 11,
            )),
      ),
      home: const SplashScreen(),
    );
  }
}
