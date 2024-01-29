import 'dart:async';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog_app/carousel/carousel_slider.dart';
import 'package:flutter_blog_app/constants.dart';
import 'package:flutter_blog_app/data.dart';
import 'package:flutter_blog_app/main.dart';
import 'package:flutter_blog_app/pages/article_page.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final List<PostData> posts = [
    PostData(
      id: 1,
      title: 'BMW M5 Competition Review 2021',
      caption: 'TOP GEAR',
      isBookmarked: false,
      likes: '3.1k',
      time: '1hr ago',
      imageFileName: 'small_post_1.jpg',
      text: 'FDSALKJFASLKDFJ FKDAS;LJFASLKDF',
    ),
  ];

  final categories = [
    AppDatabase.categories[0],
  ].obs;

  @override
  void onInit() {
    super.onInit();
    Timer.periodic(Duration(seconds: 3), (timer) {
      posts.add(AppDatabase.posts[2]);
      update(['Latest Posts']);
    });

    Timer.periodic(Duration(seconds: 5), (timer) {
      categories.add(AppDatabase.categories[2]);
    });
  }

  void onAddBookmarkCliked(int id) {
    var c = Get.find<HomeController>().posts.firstWhere((element) => element.id == id);
    c.isBookmarked = !c.isBookmarked;
    update(['Bookmark ${c.id}']);
  }
}

class TempController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}

class HomeBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut(() => HomeController()),
      Bind.put(TempController()),
    ];
  }
}

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final stories = AppDatabase.stories;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 24, 24, 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Hi , Hamed Hadi!", style: theme.textTheme.titleMedium),
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
                    child: Text("Explore today's", style: theme.textTheme.displayLarge)),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 14, 0, 14),
                  child: _StoryList(stories: stories, theme: theme),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                  child: _CategoryList(),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(25, 20, 10, 20),
                  child: _PostList(),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(13, 0, 13, 0),
                  child: GetBuilder<HomeController>(
                    id: 'Latest Posts',
                    builder: (logic) {
                      return ListView.builder(
                        physics: const ClampingScrollPhysics(),
                        itemCount: controller.posts.length,
                        itemExtent: 141,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final post = controller.posts[index];
                          return Post(post: post);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CategoryList extends GetView<HomeController> {
  const _CategoryList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return CarouselSlider.builder(
        itemCount: Get.find<HomeController>().categories.length,
        itemBuilder: (context, index, realIndex) {
          return _CategoryItem(
            category: controller.categories[index],
            left: 0,
            right: realIndex == controller.categories.length - 1 ? 32 : 0,
          );
        },
        options: CarouselOptions(
            scrollDirection: Axis.horizontal,
            viewportFraction: 0.8,
            aspectRatio: 1.2,
            padEnds: false,
            initialPage: 0,
            disableCenter: true,
            enableInfiniteScroll: false,
            enlargeCenterPage: true,
            enlargeStrategy: CenterPageEnlargeStrategy.height),
      );
    });
  }
}

class _CategoryItem extends StatelessWidget {
  final Category category;
  final double left;
  final double right;

  const _CategoryItem({
    Key? key,
    required this.category,
    required this.left,
    required this.right,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Positioned.fill(
        top: 100,
        right: 56,
        left: 56,
        bottom: 20,
        child: Container(
          decoration: const BoxDecoration(boxShadow: [BoxShadow(blurRadius: 15, color: Color(0xaa0D253C))]),
        ),
      ),
      Positioned.fill(
        left: left,
        right: right,
        child: Container(
          margin: const EdgeInsets.fromLTRB(15, 5, 0, 15),
          foregroundDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
            gradient: const LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.center,
              colors: [
                Color(0xff0D253C),
                Colors.transparent,
              ],
            ),
          ),
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(32),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(28),
            child: Image.asset(
              'assets/images/posts/large/${category.imageFileName}',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      Positioned(
        bottom: 46,
        left: 42,
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      )
    ]);
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
    final ThemeData theme = Theme.of(context);
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
            return _Story(story: story, theme: theme);
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
    final ThemeData theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(6, 2, 6, 0),
      child: Column(
        children: [
          Stack(
            children: [
              story.isViewed ? _profileImageViewed(story, theme) : _profileImageNormal(story, theme),
              Positioned(
                  bottom: 0,
                  right: 0,
                  child: Image.asset(
                    "assets/images/icons/${story.iconFileName}",
                    width: 24,
                    height: 24,
                  ))
            ],
          ),
          const SizedBox(height: 8),
          Text(story.name, style: theme.textTheme.bodyMedium),
        ],
      ),
    );
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
        padding: const EdgeInsets.all(5),
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
        color: const Color(0xff7B8BB2),
        dashPattern: const [5, 4],
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
      child: Image.asset("assets/images/stories/$imageFileName"),
    );
  }
}

class _PostList extends StatelessWidget {
  const _PostList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Latest Posts", style: Theme.of(context).textTheme.displayMedium),
            TextButton(
              onPressed: () {},
              child: const Text(
                "more",
                style: TextStyle(color: Constants.primaryColor),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class Post extends StatefulWidget {
  const Post({
    Key? key,
    required this.post,
  }) : super(key: key);

  final PostData post;

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  bool? isHovored;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          isHovored = true;
        });
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
        child: TextButton(
          onPressed: () => Get.toNamed(
            Routes.ARTICLE,
            arguments: {
              'id': widget.post.id,
            },
          ),
          style: TextButton.styleFrom(
            padding: const EdgeInsets.all(0),
            backgroundColor: Colors.transparent,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(24)),
            ),
          ),
          // borderRadius: BorderRadius.circular(24),
          child: MouseRegion(
            onEnter: (_) {
              setState(() {
                isHovored = true;
              });
            },
            onExit: (_) {
              setState(() {
                isHovored = false;
              });
            },
            child: Container(
              // height: 149,
              // width: 149,
              // margin: const EdgeInsets.fromLTRB(10, 8, 10, 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                boxShadow: const [
                  BoxShadow(blurRadius: 10, color: Color(0x1a5282FF)),
                ],
              ),
              child: Material(
                color: (isHovored ?? false) ? Colors.white70 : Colors.white,
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset('assets/images/posts/small/${widget.post.imageFileName}'),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              widget.post.caption,
                              style: Theme.of(context).textTheme.displaySmall!.apply(color: const Color(0xff376AED)),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              widget.post.title,
                              style: Theme.of(context).textTheme.displaySmall,
                            ),
                            const SizedBox(height: 15),
                            Row(children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Row(
                                  children: [
                                    Icon(
                                      CupertinoIcons.hand_thumbsup,
                                      size: 16,
                                      color: Theme.of(context).textTheme.bodyMedium!.color,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      widget.post.likes,
                                      style: Theme.of(context).textTheme.titleSmall,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Row(
                                  children: [
                                    Icon(
                                      CupertinoIcons.clock,
                                      size: 16,
                                      color: Theme.of(context).textTheme.bodyMedium!.color,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      widget.post.time,
                                      style: Theme.of(context).textTheme.titleSmall,
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.centerRight,
                                  child: GetBuilder<HomeController>(
                                      id: 'Bookmark ${widget.post.id}',
                                      builder: (logic) {
                                        return Icon(
                                          widget.post.isBookmarked
                                              ? CupertinoIcons.bookmark_fill
                                              : CupertinoIcons.bookmark,
                                          size: 16,
                                          // color: Theme.of(context).textTheme.bodyMedium!.color,
                                        );
                                      }),
                                ),
                              ),
                            ])
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
