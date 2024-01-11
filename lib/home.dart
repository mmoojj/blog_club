import 'package:blogclub/article.dart';
import 'package:blogclub/carousel/carousel_slider.dart';
import 'package:blogclub/data.dart';
import 'package:blogclub/gen/fonts.gen.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final storeis = AppDatabase.stories;
    final category = AppDatabase.categories;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 20, 32, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Hi , Jonathon!",
                      style: themeData.textTheme.titleMedium,
                    ),
                    Image.asset(
                      "assets/img/icons/notification.png",
                      width: 32,
                      height: 32,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 0, 0, 24),
                child: Text(
                  "Explore today's",
                  style: themeData.textTheme.headlineMedium,
                ),
              ),
              _StoryList(storeis: storeis),
              const SizedBox(
                height: 16,
              ),
              _CategoryList(category: category),
              const _PostList()
            ],
          ),
        ),
      ),
    );
  }
}

class _CategoryList extends StatelessWidget {
  const _CategoryList({
    super.key,
    required this.category,
  });

  final List<Category> category;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        itemCount: category.length,
        itemBuilder: (context, index, realindex) {
          return _CategoryItem(
            category: category[realindex],
            left: realindex == 0 ? 32 : 8,
            right: realindex == category.length - 1 ? 32 : 8,
          );
        },
        options: CarouselOptions(
            viewportFraction: 0.8,
            scrollDirection: Axis.horizontal,
            initialPage: 0,
            aspectRatio: 1.2,
            disableCenter: true,
            enableInfiniteScroll: false,
            enlargeCenterPage: true,
            scrollPhysics: const BouncingScrollPhysics(),
            enlargeStrategy: CenterPageEnlargeStrategy.height,
            padEnds: false)
            );
  }
}

class _CategoryItem extends StatelessWidget {
  final Category category;
  final double left;
  final double right;
  const _CategoryItem(
      {super.key,
      required this.category,
      required this.left,
      required this.right});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(left, 0, right, 0),
      child: Stack(
        children: [
          Positioned.fill(
              top: 100,
              right: 25,
              left: 10,
              bottom: 20,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    boxShadow: const [
                      BoxShadow(blurRadius: 25, color: Color(0xaa0D253C))
                    ]),
              )),
          Positioned.fill(
            child: Container(
              foregroundDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  gradient: const LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.center,
                      colors: [Color(0xff0D253C), Colors.transparent])),
              margin: const EdgeInsets.fromLTRB(0, 16, 0, 16),
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(32)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(32),
                child: Image.asset(
                  "assets/img/posts/large/${category.imageFileName}",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
              bottom: 46,
              left: 46,
              child: Text(
                category.title,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .apply(color: Colors.white),
              ))
        ],
      ),
    );
  }
}

class _StoryList extends StatelessWidget {
  const _StoryList({
    super.key,
    required this.storeis,
  });

  final storeis;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 100,
      child: ListView.builder(
          itemCount: storeis.length,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final story = storeis[index];
            return _Story(story: story);
          }),
    );
  }
}

class _Story extends StatelessWidget {
  const _Story({
    super.key,
    required this.story,
  });

  final story;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(4, 0, 4, 0),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              story.isViewed ? _profileStoryVisited() : _profileStoryNormal(),
              Image.asset(
                "assets/img/icons/${story.iconFileName}",
                width: 24,
                height: 24,
              )
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Text(story.name),
        ],
      ),
    );
  }

  Widget _profileStoryNormal() {
    return Container(
      width: 68,
      height: 68,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: const LinearGradient(begin: Alignment.topLeft, colors: [
            Color(0xff376AED),
            Color(0xff49B0E2),
            Color(0xff9CECFB),
          ])),
      child: Container(
        margin: const EdgeInsets.all(2),
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22),
        ),
        child: _profileImage(),
      ),
    );
  }

  Widget _profileStoryVisited() {
    return DottedBorder(
      borderType: BorderType.RRect,
      strokeWidth: 2,
      dashPattern: const [5, 4],
      color: const Color(0xff7B8BB2),
      radius: const Radius.circular(24),
      child: Container(
        width: 68,
        height: 68,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
        ),
        child: _profileImage(),
      ),
    );
  }

  Widget _profileImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(17),
      child: Image.asset("assets/img/stories/${story.imageFileName}"),
    );
  }
}

class _PostList extends StatelessWidget {
  const _PostList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final posts = AppDatabase.posts;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 32, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Latest News",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              TextButton(onPressed: () => {}, child: const Text("More"))
            ],
          ),
        ),
        ListView.builder(
            itemCount: posts.length,
            itemExtent: 141,
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemBuilder: (context, index) {
              final post = posts[index];
              return Post(post: post);
            })
      ],
    );
  }
}

class Post extends StatelessWidget {
  const Post({
    super.key,
    required this.post,
  });

  final PostData post;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (contex) => ArticleScreen()));
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(blurRadius: 10, color: Color(0x1a5282FF))
            ]),
        height: 149,
        margin: const EdgeInsets.fromLTRB(32, 8, 32, 8),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset("assets/img/posts/small/${post.imageFileName}",
                  width: MediaQuery.of(context).size.width / 3),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    post.caption,
                    style: const TextStyle(
                      fontSize: 14,
                      fontFamily: FontFamily.avenir,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    post.title,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(fontWeight: FontWeight.w400, fontSize: 14),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        CupertinoIcons.hand_thumbsup,
                        size: 16,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(post.likes),
                      const SizedBox(
                        width: 16,
                      ),
                      const Icon(
                        CupertinoIcons.clock,
                        size: 16,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(post.time),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(right: 16),
                          alignment: Alignment.centerRight,
                          child: post.isBookmarked
                              ? const Icon(CupertinoIcons.bookmark_fill)
                              : const Icon(
                                  CupertinoIcons.bookmark,
                                  size: 16,
                                ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
