import 'package:flutter/material.dart';
import 'package:flutter_blog_app/constants.dart';
import 'package:flutter_blog_app/gen/assets.gen.dart';
import 'package:flutter_blog_app/main.dart';

class BottomNavigation extends StatelessWidget {
  final Function(int index) onTap;
  final int selectedIndex;

  const BottomNavigation(
      {Key? key, required this.onTap, required this.selectedIndex})
      : super(key: key);

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
                child: Assets.images.icons.plus.image(width: 32, height: 32),
              ),
            ),
          ),
          Positioned(
            right: 0,
            left: 0,
            bottom: 0,
            child: SizedBox(
              height: 65,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _BottomNavigationItem(
                    iconFileName: "Home.png",
                    activeIconFileName: "Home.png",
                    title: "Home",
                    isActive: selectedIndex == homeIndex,
                    onTap: () {
                      onTap(homeIndex);
                    },
                  ),
                  _BottomNavigationItem(
                    iconFileName: "Articles.png",
                    activeIconFileName: "Articles.png",
                    title: "Articles",
                    isActive: selectedIndex == articleIndex,
                    onTap: () {
                      onTap(articleIndex);
                    },
                  ),
                  Expanded(child: Container()),
                  _BottomNavigationItem(
                    iconFileName: "Search.png",
                    activeIconFileName: "Search.png",
                    title: "Search",
                    isActive: selectedIndex == searchIndex,
                    onTap: () {
                      onTap(searchIndex);
                    },
                  ),
                  _BottomNavigationItem(
                    iconFileName: "Menu.png",
                    activeIconFileName: "Menu.png",
                    title: "Menu",
                    isActive: selectedIndex == menuIndex,
                    onTap: () {
                      onTap(menuIndex);
                    },
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
  final bool isActive;
  final Function() onTap;

  const _BottomNavigationItem({
    Key? key,
    required this.iconFileName,
    required this.activeIconFileName,
    required this.title,
    required this.isActive,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/icons/$iconFileName"),
            const SizedBox(height: 4),
            Text(
              title,
              style: Theme.of(context).textTheme.bodySmall!.apply(
                    color: isActive
                        ? Constants.primaryColor
                        : Constants.secondaryTextColor,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
