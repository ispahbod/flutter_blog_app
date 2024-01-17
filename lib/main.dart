import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_blog_app/gen/assets.gen.dart';
import 'package:flutter_blog_app/gen/fonts.gen.dart';
import 'package:flutter_blog_app/gen/fonts.gen.dart';
import 'package:flutter_blog_app/gen/fonts.gen.dart';
import 'package:flutter_blog_app/gen/fonts.gen.dart';
import 'package:flutter_blog_app/gen/fonts.gen.dart';
import 'package:flutter_blog_app/gen/fonts.gen.dart';
import 'package:flutter_blog_app/gen/fonts.gen.dart';
import 'package:flutter_blog_app/gen/fonts.gen.dart';
import 'package:flutter_blog_app/gen/fonts.gen.dart';
import 'package:flutter_blog_app/navigation.dart';
import 'constants.dart';
import 'navigation.dart';
import 'pages/home_page.dart';
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
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
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
      // home: Stack(
      //   children: [
      //     const Positioned.fill(child: HomeScreen()),
      //     Positioned(bottom: 0, right: 0, left: 0, child: BottomNavigation()),
      //   ],
      // ),
    );
  }
}