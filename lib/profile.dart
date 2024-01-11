import 'package:blogclub/data.dart';
import 'package:blogclub/gen/assets.gen.dart';
import 'package:blogclub/home.dart';

import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final post = AppDatabase.posts;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBar(
                title: const Text("Profile"),
                elevation: 0,
                backgroundColor: themeData.colorScheme.background.withOpacity(0),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.more_horiz),
                    onPressed: () {},
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                ],
              ),
              Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(32, 0, 32, 64),
                    decoration: BoxDecoration(
                        color: themeData.colorScheme.surface,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 20,
                            color: themeData.colorScheme.onBackground
                                .withOpacity(0.1),
                          )
                        ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
                          child: Row(
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Assets.img.stories.story8
                                      .image(width: 84, height: 84)),
                              const SizedBox(
                                width: 16,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text("@jovidan"),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      "Joive Danial",
                                      style: themeData.textTheme.bodyLarge,
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      "UX Designer",
                                      style: themeData.textTheme.bodyLarge!.apply(
                                          color: themeData.colorScheme.primary),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
                          child: Text(
                            "About Me",
                            style: themeData.textTheme.headlineSmall,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(32, 4, 32, 32),
                          child: Text(
                            "Madison Blackstone is a director of user experience design, with experience managing global teams.",
                            style: themeData.textTheme.bodyLarge!
                                .copyWith(fontWeight: FontWeight.w300),
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 16,
                    left: 96,
                    right: 96,
                    child: Container(
                      height: 32,
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            blurRadius: 20,
                            color: themeData.colorScheme.onBackground
                                .withOpacity(0.5))
                      ]),
                    ),
                  ),
                  Positioned(
                    bottom: 32,
                    left: 64,
                    right: 64,
                    child: Container(
                      height: 64,
                      decoration: BoxDecoration(
                        color: themeData.colorScheme.primary,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xff2151CD),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "52",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: themeData.colorScheme.onPrimary),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    "POST",
                                    style: themeData.textTheme.bodyLarge!
                                        .copyWith(
                                            fontWeight: FontWeight.w300,
                                            fontSize: 12,
                                            color:
                                                themeData.colorScheme.onPrimary),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "250",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: themeData.colorScheme.onPrimary),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  "FOLLOWING",
                                  style: themeData.textTheme.bodyLarge!.copyWith(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 12,
                                      color: themeData.colorScheme.onPrimary),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "4.5k",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: themeData.colorScheme.onPrimary),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  "FOLLOWERS",
                                  style: themeData.textTheme.bodyLarge!.copyWith(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 12,
                                      color: themeData.colorScheme.onPrimary),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  color: themeData.colorScheme.surface,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                              child: Text(
                            "My Post",
                            style: themeData.textTheme.headlineSmall,
                          )),
                          IconButton(
                              onPressed: () {},
                              icon: Assets.img.icons.grid.svg()),
                          IconButton(
                              onPressed: () {},
                              icon: Assets.img.icons.table.svg())
                        ],
                      ),
                    ),
                    for (var i = 0; i < post.length; i++) Post(post: post[i])
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
