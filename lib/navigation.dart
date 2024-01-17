import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog_app/gen/assets.gen.dart';

class BottomNavigation extends StatelessWidget {
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
                child: Assets.images.icons.plus.image(width: 32,height: 32),
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