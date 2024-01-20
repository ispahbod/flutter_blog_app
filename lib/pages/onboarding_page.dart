import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_blog_app/data.dart';
import 'package:flutter_blog_app/gen/assets.gen.dart';
import 'package:flutter_blog_app/pages/auth.dart';
import 'package:flutter_blog_app/pages/home_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController _pageController = PageController();
  int page = 0; // Move page variable outside build method

  @override
  void initState() {
    _pageController.addListener(() {
      if (_pageController.page!.round() != page) {
        setState(() {
          page = _pageController.page!.round();
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final boards = AppDatabase.onBoardingItems;

    return Scaffold(
      backgroundColor: themeData.colorScheme.background,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
                child: Assets.images.background.onboarding.image(),
              ),
            ),
            Container(
              height: 324,
              child: Container(
                decoration: BoxDecoration(
                  color: themeData.colorScheme.surface,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 20,
                      color: Colors.black.withOpacity(0.1),
                    )
                  ],
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 50, right: 30, left: 30),
                        child: PageView.builder(
                          itemBuilder: (context, index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(boards[index].title, style: themeData.textTheme.displayLarge),
                                SizedBox(height: 25),
                                Text(boards[index].description, style: themeData.textTheme.bodyMedium),
                              ],
                            );
                          },
                          itemCount: boards.length,
                          controller: _pageController,
                        ),
                      ),
                    ),
                    Container(
                      height: 110,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SmoothPageIndicator(
                              controller: _pageController,
                              count: 4,
                              effect: ExpandingDotsEffect(
                                dotWidth: 8,
                                dotHeight: 8,
                                activeDotColor: themeData.colorScheme.primary,
                                dotColor: themeData.colorScheme.primary.withOpacity(0.1),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                if (page == boards.length - 1) {
                                  Navigator.of(context).pushReplacement(CupertinoPageRoute(builder: (builder) => AuthScreen()));
                                } else {
                                  _pageController.animateToPage(page + 1, duration: Duration(milliseconds: 500), curve: Curves.decelerate);
                                }
                              },
                              style: ButtonStyle(
                                minimumSize: MaterialStateProperty.all(Size(90, 60)),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              ),
                              child: Icon(page == boards.length - 1 ? CupertinoIcons.check_mark : CupertinoIcons.arrow_right),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
