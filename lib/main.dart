import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_blog_app/gen/fonts.gen.dart';
import 'package:flutter_blog_app/navigation.dart';
import 'package:flutter_blog_app/pages/article_page.dart';
import 'package:flutter_blog_app/pages/home_page.dart';
import 'package:flutter_blog_app/pages/onboarding_page.dart';
import 'package:flutter_blog_app/pages/profile_page.dart';
import 'package:flutter_blog_app/pages/search_page.dart';
import 'package:get/get.dart';
import 'constants.dart';

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
    return GetMaterialApp(
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
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Constants.primaryTextColor,
          elevation: 0,
        ),
        textTheme: const TextTheme(
            titleMedium: TextStyle(
              fontFamily: FontFamily.avenir,
              fontWeight: FontWeight.w500,
              color: Constants.secondaryTextColor,
              fontSize: 18,
            ),
            titleSmall: TextStyle(
              fontFamily: FontFamily.avenir,
              fontWeight: FontWeight.w500,
              color: Constants.secondaryTextColor,
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
              color: Constants.secondaryTextColor,
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
              color: Constants.secondaryTextColor,
              fontSize: 11,
            )),
      ),
      home: const OnBoardingScreen(),
      getPages: AppPages.routes,
      initialRoute: AppPages.INITIAL,
    );
  }
}

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
      // binding: HomeBinding(),
    ), GetPage(
      name: Routes.ARTICLE,
      page: () => const ArticleScreen(),
      transition: Transition.cupertino,
      // binding: HomeBinding(),
    ),
  ];
}

abstract class Routes {
  Routes._();
  static const HOME = _Paths.HOME;
  static const ARTICLE = _Paths.ARTICLE;
}

abstract class _Paths {
  _Paths._();
  static const HOME = '/home';
  static const ARTICLE = '/article';
}


class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

const int homeIndex = 0;
const int articleIndex = 1;
const int searchIndex = 2;
const int menuIndex = 3;
const double bottomNavigationHeight = 65;

class _MainScreenState extends State<MainScreen> {
  int selectedScreenIndex = homeIndex;
  final List<int> _history = [];
  final GlobalKey<NavigatorState> _homeKey = GlobalKey();
  final GlobalKey<NavigatorState> _articleKey = GlobalKey();
  final GlobalKey<NavigatorState> _searchKey = GlobalKey();
  final GlobalKey<NavigatorState> _menuKey = GlobalKey();

  late final map = {
    homeIndex: _homeKey,
    articleIndex: _articleKey,
    searchIndex: _searchKey,
    menuIndex: _menuKey,
  };

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) async {
        final NavigatorState currentSelectedTabNavigatorState = map[selectedScreenIndex]!.currentState!;
        if (currentSelectedTabNavigatorState.canPop()) {
          currentSelectedTabNavigatorState.pop();
          return;
        } else if (_history.isNotEmpty) {
          setState(() {
            selectedScreenIndex = _history.last;
            _history.removeLast();
          });
          return;
        }
        Navigator.of(context).pop();
      },
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              bottom: bottomNavigationHeight,
              left: 0,
              right: 0,
              child: IndexedStack(
                index: selectedScreenIndex,
                children: [
                  _navigator(_homeKey, homeIndex, const HomeView()),
                  _navigator(_articleKey, articleIndex, const ArticleScreen()),
                  _navigator(_searchKey, searchIndex, const SearchScreen()),
                  _navigator(_menuKey, menuIndex, const ProfileScreen()),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: BottomNavigation(
                selectedIndex: selectedScreenIndex,
                onTap: (int index) {
                  setState(() {
                    _history.remove(selectedScreenIndex);
                    _history.add(selectedScreenIndex);
                    selectedScreenIndex = index;
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _navigator(GlobalKey key, int index, Widget child) {
    if (key.currentState == null && selectedScreenIndex != index) {
      return Container();
    }
    return Navigator(
      key: key,
      onGenerateRoute: (settings) => MaterialPageRoute(
        builder: (context) => Offstage(
          offstage: selectedScreenIndex != index,
          child: child,
        ),
      ),
    );
  }
}
