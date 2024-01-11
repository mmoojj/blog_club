import 'package:blogclub/article.dart';

import 'package:blogclub/gen/fonts.gen.dart';
import 'package:blogclub/home.dart';
import 'package:blogclub/profile.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const primaryTextColor = Color(0xff0D253C);
    const secondryTextColor = Color(0xff2D4379);
    const primarycolor = Color(0xff376AED);
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textButtonTheme: TextButtonThemeData(
              style: ButtonStyle(
                  textStyle: MaterialStateProperty.all(const TextStyle(
                      fontFamily: FontFamily.avenir,
                      fontSize: 14,
                      fontWeight: FontWeight.w400)))),
          textTheme: const TextTheme(
            bodySmall: TextStyle(
                fontFamily: FontFamily.avenir,
                fontWeight: FontWeight.w700,
                color: Color(0xff7B8BB2),
                fontSize: 10),
            headlineSmall: TextStyle(
                fontFamily: FontFamily.avenir,
                fontSize: 20,
                color: primaryTextColor,
                fontWeight: FontWeight.w700),
            headlineMedium: TextStyle(
              fontFamily: FontFamily.avenir,
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: primaryTextColor,
            ),
            bodyMedium: TextStyle(
              fontFamily: FontFamily.avenir,
              color: secondryTextColor,
              fontSize: 14,
            ),
            titleMedium: TextStyle(
              fontFamily: FontFamily.avenir,
              color: secondryTextColor,
              fontWeight: FontWeight.w200,
              fontSize: 18,
            ),
            titleLarge: TextStyle(
                fontFamily: FontFamily.avenir,
                fontWeight: FontWeight.bold,
                color: primaryTextColor),
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            titleSpacing: 32,
          ),
          colorScheme: const ColorScheme.light(
              primary: primarycolor,
              onPrimary: Colors.white,
              onSurface: primaryTextColor,
              onBackground: primaryTextColor,
              background: Color(0xffFBFCFF),
              surface: Colors.white)),
      // home: Stack(children: [
      //   const Positioned.fill(
      //     child: HomeScreen(),
      //   ),
      //   Positioned(bottom: 0, right: 0, left: 0, child: _BottomNav())
      // ]),
      home: const MainSreen(),
    );
  }
}

const homeindex = 0;
const articleindex = 1;
const searchindex = 2;
const profileindex = 3;

class MainSreen extends StatefulWidget {
  const MainSreen({super.key});

  @override
  State<MainSreen> createState() => _MainSreenState();
}

class _MainSreenState extends State<MainSreen> {
  int curentindex = homeindex;
  bool floatActionBtnActivate = false;
  final GlobalKey<NavigatorState> _homenavigatorstate = GlobalKey();
  final GlobalKey<NavigatorState> _articlenavigatorstate = GlobalKey();
  final GlobalKey<NavigatorState> _searchnavigatorstate = GlobalKey();
  final GlobalKey<NavigatorState> _profilenavigatorstate = GlobalKey();

  final List<int> _history = [];

  late final map = {
    homeindex: _homenavigatorstate,
    articleindex: _articlenavigatorstate,
    searchindex: _searchnavigatorstate,
    profileindex: _profilenavigatorstate,
  };

  Future<bool> _willpop() async {
    final NavigatorState currentNavState = map[curentindex]!.currentState!;
    if (currentNavState.canPop()) {
      currentNavState.pop();
      return false;
    } else if (_history.isNotEmpty) {
      setState(() {
        curentindex = _history.last;
        _history.removeLast();
      });
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _willpop,
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              bottom: 65,
              child: IndexedStack(
                index: curentindex,
                children: [
                  _navigator(
                      _homenavigatorstate, homeindex, const HomeScreen()),
                  _navigator(_articlenavigatorstate, articleindex,
                      const ArticleScreen()),
                  _navigator(
                      _searchnavigatorstate, searchindex, const SearchScreen()),
                  _navigator(_profilenavigatorstate, profileindex,
                      const ProfileScreen()),
                ],
              ),
            ),
            floatActionBtnActivate
                ? Positioned(
                    bottom: 100,
                    left: 50,
                    right: 50,
                    child: Container(
                      height: 48,
                      decoration: BoxDecoration(
                          color: Color(0xff0D253C),
                          borderRadius: BorderRadius.circular(32)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children:const [
                          Icon(CupertinoIcons.printer, color: Colors.white),
                          Icon(CupertinoIcons.alt, color: Colors.white),
                          Icon(CupertinoIcons.app_fill, color: Colors.white),
                          Icon(CupertinoIcons.ant, color: Colors.white),
                          Icon(CupertinoIcons.archivebox, color: Colors.white),
                        ],
                      ),
                    ),
                  )
                : Container(),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: _BottomNav(
                floatActionBtnPreass: (){
                  setState(() {
                    floatActionBtnActivate = !floatActionBtnActivate;
                  });
                },
                ontap: (index) {
                  _history.remove(curentindex);
                  _history.add(curentindex);
                  setState(() {
                    curentindex = index;
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
    return key.currentState == null && curentindex != index
        ? Container()
        : Navigator(
            key: key,
            onGenerateRoute: (settings) => MaterialPageRoute(
                builder: (context) =>
                    Offstage(offstage: curentindex != index, child: child)),
          );
  }
}

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Search Screen"),
    );
  }
}

class _BottomNav extends StatelessWidget {
  final Function(int index) ontap;
  final Function()  floatActionBtnPreass;

  const _BottomNav({super.key, required this.ontap , required this.floatActionBtnPreass});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              height: 65,
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    blurRadius: 20,
                    color: const Color(0x009b8487).withOpacity(0.3))
              ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _BottomNavItem(
                      iconFileName: "Home.png",
                      activeIconFileName: "Home.png",
                      title: "Home",
                      ontap: () {
                        ontap(homeindex);
                      }),
                  _BottomNavItem(
                      iconFileName: "Articles.png",
                      activeIconFileName: "Articles.png",
                      title: "Article",
                      ontap: () {
                        ontap(articleindex);
                      }),
                  Expanded(child: Container()),
                  _BottomNavItem(
                      iconFileName: "Search.png",
                      activeIconFileName: "Search.png",
                      title: "Search",
                      ontap: () {
                        ontap(searchindex);
                      }),
                  _BottomNavItem(
                      iconFileName: "Menu.png",
                      activeIconFileName: "Menu.png",
                      title: "Menu",
                      ontap: () {
                        ontap(profileindex);
                      }),
                ],
              ),
            ),
          ),
          Center(
            child: InkWell(
              onTap: floatActionBtnPreass,
              child: Container(
                width: 65,
                height: 85,
                alignment: Alignment.topCenter,
                child: Container(
                  height: 65,
                  decoration: BoxDecoration(
                      color: const Color(0xff376AED),
                      border: Border.all(color: Colors.white, width: 4),
                      borderRadius: BorderRadius.circular(32.5)),
                  child: Image.asset("assets/img/icons/plus.png"),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BottomNavItem extends StatelessWidget {
  final String iconFileName;
  final String activeIconFileName;
  final String title;
  final Function() ontap;

  const _BottomNavItem(
      {super.key,
      required this.iconFileName,
      required this.activeIconFileName,
      required this.ontap,
      required this.title});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: ontap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/img/icons/$iconFileName"),
            const SizedBox(
              height: 4,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.bodySmall,
            )
          ],
        ),
      ),
    );
  }
}
