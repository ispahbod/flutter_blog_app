import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'constants.dart';
import 'pages/home_page.dart';

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
                fontFamily: Constants.themeFontFamily,
              ),
            ),
          ),
        ),
        textTheme: const TextTheme(
          titleMedium: TextStyle(
            fontFamily: Constants.themeFontFamily,
            fontWeight: FontWeight.w500,
            color: Constants.secondryTextColor,
            fontSize: 18,
          ),
          titleSmall: TextStyle(
            fontFamily: Constants.themeFontFamily,
            fontWeight: FontWeight.w500,
            color: Constants.secondryTextColor,
            fontSize: 12,
          ),
          displayLarge: TextStyle(
            fontFamily: Constants.themeFontFamily,
            fontWeight: FontWeight.w600,
            color: Constants.primaryTextColor,
            fontSize: 26,
          ),
          displayMedium: TextStyle(
            fontFamily: Constants.themeFontFamily,
            fontWeight: FontWeight.w900,
            color: Colors.black,
            fontSize: 22,
          ),
          displaySmall: TextStyle(
            fontFamily: Constants.themeFontFamily,
            fontWeight: FontWeight.w500,
            color: Colors.black,
            fontSize: 13,
          ),
          bodyMedium: TextStyle(
            fontFamily: Constants.themeFontFamily,
            fontWeight: FontWeight.w500,
            color: Constants.secondryTextColor,
            fontSize: 14,
          ),
          bodyLarge: TextStyle(
            fontFamily: Constants.themeFontFamily,
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontSize: 18,
          ),
          bodySmall: TextStyle(
            fontFamily: Constants.themeFontFamily,
            fontWeight: FontWeight.w600,
            color: Constants.secondryTextColor,
            fontSize: 11,
          )
        ),
      ),
      home: Stack(
        children: [
          const Positioned.fill(child: HomeScreen()),
          Positioned(bottom: 0, right: 0, left: 0, child: _BottomNavigation()),
        ],
      ),
    );
  }
}

class _BottomNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            color: const Color(0xff9B8487).withOpacity(0.3),
          )
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 65,
              decoration: const BoxDecoration(color: Colors.white),
            ),
          ),
          Center(
            child: Container(
              width: 60,
              height: 85,
              alignment: Alignment.topCenter,
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 4),
                  borderRadius: BorderRadius.circular(32.5),
                  color: const Color(0xff376AED),
                ),
                child: Image.asset('assets/images/icons/plus.png'),
              ),
            ),
          ),
          Positioned(
            right: 0,
            left: 0,
            bottom: 0,
            child: Container(
              height: 65,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _BottomNavigationItem(
                    iconFileName: "Home.png",
                    activeIconFileName: "Home.png",
                    title: "Home",
                  ),
                  _BottomNavigationItem(
                    iconFileName: "Articles.png",
                    activeIconFileName: "Articles.png",
                    title: "Articles",
                  ),
                  SizedBox(width: 45),
                  _BottomNavigationItem(
                    iconFileName: "Search.png",
                    activeIconFileName: "Search.png",
                    title: "Search",
                  ),
                  _BottomNavigationItem(
                    iconFileName: "Menu.png",
                    activeIconFileName: "Menu.png",
                    title: "Menu",
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BottomNavigationItem extends StatelessWidget {
  final String iconFileName;
  final String activeIconFileName;
  final String title;

  const _BottomNavigationItem({
    Key? key,
    required this.iconFileName,
    required this.activeIconFileName,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("assets/images/icons/${iconFileName}"),
        const SizedBox(height: 4),
        Text(title, style: Theme.of(context).textTheme.bodySmall),
      ],
    );
  }
}
