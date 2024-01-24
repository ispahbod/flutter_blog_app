import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog_app/gen/assets.gen.dart';
import 'package:flutter_blog_app/pages/onboarding_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2)).then((value) => {
          // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomeScreen()))
          // Navigator.of(context).push(CupertinoPageRoute(builder: (context)=>HomeScreen()))
          // Navigator.of(context).pushReplacement(CupertinoPageRoute(builder: (context)=>HomeScreen()))
          Navigator.of(context).pushReplacement(
            CupertinoPageRoute(
              builder: (context) => const OnBoardingScreen(),
            ),
          )
        });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
              child: Assets.images.background.splash.image(fit: BoxFit.cover)),
          Center(child: Assets.images.icons.logo.svg(width: 150))
        ],
      ),
    );
  }
}
