import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog_app/data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData _theme = Theme.of(context)!;
    final stories = AppDatabase.stories;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 24, 24, 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Hi , Hamed Hadi!", style: _theme.textTheme.subtitle1),
                    Image.asset(
                      "assets/images/icons/notification.png",
                      width: 34,
                      height: 34,
                    ),
                  ],
                ),
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(23, 0, 24, 0),
                  child: Text("Explore today's",
                      style: _theme.textTheme.headline6)),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 14, 0, 14),
                child: _StoryList(stories: stories, theme: _theme),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StoryList extends StatelessWidget {
  const _StoryList({
    Key? key,
    required this.stories,
    required this.theme,
  }) : super(key: key);
  final List<StoryData> stories;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    final ThemeData _theme = theme;
    return SizedBox(
      height: 100,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.only(left: 14),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: stories.length,
          itemBuilder: (context, index) {
            final story = stories[index];
            return _Story(story: story, theme: _theme);
          },
        ),
      ),
    );
  }
}

class _Story extends StatelessWidget {
  const _Story({
    Key? key,
    required this.story,
    required this.theme,
  }) : super(key: key);
  final StoryData story;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    final ThemeData _theme = theme;
    return Padding(
      padding: const EdgeInsets.fromLTRB(6, 2, 6, 0),
      child: Column(
        children: [
          Stack(
            children: [
              story.isViewed
                  ? _profileImageViewed(story, _theme)
                  : _profileImageNormal(story, _theme),
              Positioned(
                  bottom: 0,
                  right: 0,
                  child: Image.asset(
                      "assets/images/icons/${story.iconFileName}",
                      width: 24,
                      height: 24))
            ],
          ),
          SizedBox(height: 8),
          Text(story.name, style: _theme.textTheme.bodyText2),
        ],
      ),
    );
  }
}

Widget _profileImageNormal(story, theme) {
  return Container(
    height: 68,
    width: 68,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(24),
      gradient: const LinearGradient(
        begin: Alignment.topLeft,
        colors: [
          Color(0xff376AED),
          Color(0xff49B0E2),
          Color(0xff9CECFB),
        ],
      ),
    ),
    child: Container(
      margin: const EdgeInsets.all(2.5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
      ),
      padding: EdgeInsets.all(5),
      child: _profileImage(story.imageFileName),
    ),
  );
}

Widget _profileImageViewed(story, theme) {
  return SizedBox(
    height: 68,
    width: 68,
    child: DottedBorder(
      borderType: BorderType.RRect,
      color: Color(0xff7B8BB2),
      dashPattern: [5, 4],
      strokeWidth: 2,
      radius: const Radius.circular(24),
      padding: const EdgeInsets.all(6),
      child: Container(
        height: 68,
        width: 68,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
        ),
        child: _profileImage(story.imageFileName),
      ),
    ),
  );
}

Widget _profileImage(imageFileName) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(16),
    child: Image.asset("assets/images/stories/${imageFileName}"),
  );
}
