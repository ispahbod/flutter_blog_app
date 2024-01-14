import 'package:flutter/material.dart';
import 'constants.dart';
import 'pages/home_page.dart';

void main() {
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
          textTheme: TextTheme(
            subtitle1: TextStyle(
              fontFamily: Constants.themeFontFamily,
              fontWeight: FontWeight.w500,
              color: Constants.secondryTextColor,
              fontSize: 18,
            ),
            headline5: TextStyle(
              fontFamily: Constants.themeFontFamily,
              fontWeight: FontWeight.w600,
              color: Colors.white,
              fontSize: 18,
            ),
            headline6: TextStyle(
              fontFamily: Constants.themeFontFamily,
              fontWeight: FontWeight.w600,
              color: Constants.primaryTextColor,
              fontSize: 26,
            ),
            bodyText2: TextStyle(
              fontFamily: Constants.themeFontFamily,
              fontWeight: FontWeight.w500,
              color: Constants.secondryTextColor,
              fontSize: 14,
            ),
          )),
      home: const HomeScreen(),
    );
  }
}