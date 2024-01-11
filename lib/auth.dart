import 'package:blogclub/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class AuthSreen extends StatefulWidget {
  const AuthSreen({super.key});

  @override
  State<AuthSreen> createState() => _AuthSreenState();
}

enum SelectedTab { logintab, signuptab }

class _AuthSreenState extends State<AuthSreen> {
  SelectedTab currenttab = SelectedTab.logintab;
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final tabTextStyle = TextStyle(
        color: themeData.colorScheme.onPrimary,
        fontWeight: FontWeight.bold,
        fontSize: 18);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 32, bottom: 32),
              child: Assets.img.icons.logo.svg(width: 120),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: themeData.colorScheme.primary,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32)),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(
                            onPressed: () {
                              setState(() {
                                currenttab = SelectedTab.logintab;
                              });
                            },
                            child: Text(
                              "Login".toUpperCase(),
                              style: tabTextStyle.apply(
                                  color: currenttab == SelectedTab.logintab
                                      ? Colors.white
                                      : Colors.white54),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                currenttab = SelectedTab.signuptab;
                              });
                            },
                            child: Text(
                              "Signup".toUpperCase(),
                              style: tabTextStyle.apply(
                                  color: currenttab == SelectedTab.signuptab
                                      ? Colors.white
                                      : Colors.white54),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(32),
                              topRight: Radius.circular(32)),
                          color: themeData.colorScheme.surface,
                        ),
                        child: SingleChildScrollView(
                          child: Padding(
                              padding: const EdgeInsets.all(32),
                              child: currenttab == SelectedTab.signuptab
                                  ? _Signup(themeData: themeData)
                                  : _Login(themeData: themeData)),
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

class _Login extends StatelessWidget {
  const _Login({
    super.key,
    required this.themeData,
  });

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "wellcome back",
          style: themeData.textTheme.headlineMedium,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          "Signin with your account",
          style: themeData.textTheme.bodyMedium,
        ),
        const SizedBox(
          height: 16,
        ),
        const TextField(
          decoration: InputDecoration(
            label: Text("Username"),
          ),
        ),
        const TextFielPassword(),
        const SizedBox(
          height: 24,
        ),
        ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))),
              minimumSize: MaterialStateProperty.all(
                  Size(MediaQuery.of(context).size.width, 60))),
          child: const Text("LOGIN"),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Forget your Password?"),
            const SizedBox(
              width: 8,
            ),
            TextButton(onPressed: () {}, child: const Text("Reset here")),
          ],
        ),
        const Center(
          child: Text(
            "OR SIGNIN WITH",
            style: TextStyle(letterSpacing: 2),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.img.icons.google.image(width: 36, height: 36),
            const SizedBox(
              width: 24,
            ),
            Assets.img.icons.facebook.image(width: 36, height: 36),
            const SizedBox(
              width: 24,
            ),
            Assets.img.icons.twitter.image(width: 36, height: 36),
          ],
        )
      ],
    );
  }
}

class _Signup extends StatelessWidget {
  const _Signup({
    super.key,
    required this.themeData,
  });

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "wellcome to Blog Club",
          style: themeData.textTheme.headlineMedium,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          "Please Enter your Information",
          style: themeData.textTheme.bodyMedium,
        ),
        const SizedBox(
          height: 16,
        ),
        const TextField(
          decoration: InputDecoration(
            label: Text("Fullname"),
          ),
        ),
        const TextField(
          decoration: InputDecoration(
            label: Text("Username"),
          ),
        ),
        const TextFielPassword(),
        const SizedBox(
          height: 24,
        ),
        ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))),
              minimumSize: MaterialStateProperty.all(
                  Size(MediaQuery.of(context).size.width, 60))),
          child: const Text("SIGNUP"),
        ),
        SizedBox(
          height: 16,
        ),
        const Center(
          child: Text(
            "OR SIGNUP WITH",
            style: TextStyle(letterSpacing: 2),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.img.icons.google.image(width: 36, height: 36),
            const SizedBox(
              width: 24,
            ),
            Assets.img.icons.facebook.image(width: 36, height: 36),
            const SizedBox(
              width: 24,
            ),
            Assets.img.icons.twitter.image(width: 36, height: 36),
          ],
        )
      ],
    );
  }
}

class TextFielPassword extends StatefulWidget {
  const TextFielPassword({
    super.key,
  });

  @override
  State<TextFielPassword> createState() => _TextFielPasswordState();
}

class _TextFielPasswordState extends State<TextFielPassword> {
  bool obscuretext = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscuretext,
      enableSuggestions: false,
      autocorrect: false,
      decoration: InputDecoration(
          label: const Text("Password"),
          suffix: InkWell(
            onTap: () {
              setState(() {
                obscuretext = !obscuretext;
              });
            },
            child: Text(
              obscuretext ? "show" : "hide",
              style: TextStyle(
                  fontSize: 14, color: Theme.of(context).colorScheme.primary),
            ),
          )),
    );
  }
}
