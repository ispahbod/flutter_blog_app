import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog_app/constants.dart';
import 'package:flutter_blog_app/main.dart';
import '../gen/assets.gen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  static const int loginTab = 0;
  static const int signTab = 1;
  static int selectedTabIndex = loginTab;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final tabTextStyle = TextStyle(
      color: themeData.colorScheme.onPrimary,
      fontSize: 18,
      fontWeight: FontWeight.w400,
    );
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30, bottom: 30),
            child: Assets.images.icons.logo.svg(width: 120),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
                color: themeData.colorScheme.primary,
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
                              selectedTabIndex = loginTab;
                            });
                          },
                          child: Text(
                            'LOGIN',
                            style: tabTextStyle.apply(
                              color: selectedTabIndex == loginTab
                                  ? Colors.white
                                  : Colors.white.withOpacity(0.5),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              selectedTabIndex = signTab;
                            });
                          },
                          child: Text(
                            'SIGN UP',
                            style: tabTextStyle.apply(
                              color: selectedTabIndex == signTab
                                  ? Colors.white
                                  : Colors.white.withOpacity(0.5),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: themeData.colorScheme.surface,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(32),
                          topRight: Radius.circular(32),
                        ),
                      ),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(32),
                          child: selectedTabIndex == loginTab
                              ? const _Login()
                              : const _Signup(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Login extends StatelessWidget {
  const _Login({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Welcome back",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        const Text(
          "Sign in with your account",
          style: TextStyle(
            color: Color(0x7F000000),
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 24),
        const TextField(
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
            label: Text("Username"),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black12),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Constants.primaryColor),
            ),
          ),
        ),
        const SizedBox(height: 12),
        const PasswordTextField(),
        const SizedBox(height: 24),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(CupertinoPageRoute(builder: (builder) =>  MainScreen()));
          },
          style: ButtonStyle(
            backgroundColor: const MaterialStatePropertyAll(Constants.primaryColor),
            minimumSize: MaterialStatePropertyAll(
              Size(MediaQuery.of(context).size.width, 60),
            ),
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          child: const Text(
            "LOGIN",
            style: TextStyle(color: Colors.white),
          ),
        ),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Forgot your password"),
            TextButton(
              onPressed: () {},
              child: const Text("Reset here"),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Center(
          child: Text(
            "Or sign in with".toUpperCase(),
            style: const TextStyle(letterSpacing: 2),
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.images.icons.google.image(width: 36, height: 36),
            const SizedBox(width: 24),
            Assets.images.icons.facebook.image(width: 36, height: 36),
            const SizedBox(width: 24),
            Assets.images.icons.twitter.image(width: 36, height: 36),
          ],
        )
      ],
    );
  }
}

class _Signup extends StatelessWidget {
  const _Signup({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Welcome to blog club",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        const Text(
          "please enter your information",
          style: TextStyle(
            color: Color(0x7F000000),
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 24),
        const TextField(
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
            label: Text('Full name'),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black12),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Constants.primaryColor),
            ),
          ),
        ),
        const SizedBox(height: 12),
        const TextField(
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
            label: Text('Username'),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black12),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Constants.primaryColor),
            ),
          ),
        ),
        const SizedBox(height: 12),
        const PasswordTextField(),
        const SizedBox(height: 24),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(CupertinoPageRoute(builder: (builder) =>MainScreen()));
          },
          style: ButtonStyle(
            backgroundColor: const  MaterialStatePropertyAll(Constants.primaryColor),
            minimumSize: MaterialStatePropertyAll(
              Size(MediaQuery.of(context).size.width, 60),
            ),
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          child: const Text(
            "SIGN UP",
            style: TextStyle(color: Colors.white),
          ),
        ),
        const SizedBox(height: 24),
        Center(
          child: Text(
            "Or sign up with".toUpperCase(),
            style: const TextStyle(letterSpacing: 2),
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.images.icons.google.image(width: 36, height: 36),
            const SizedBox(width: 24),
            Assets.images.icons.facebook.image(width: 36, height: 36),
            const SizedBox(width: 24),
            Assets.images.icons.twitter.image(width: 36, height: 36),
          ],
        )
      ],
    );
  }
}

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    super.key,
  });

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      enableSuggestions: false,
      autocorrect: false,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        hintStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black12),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Constants.primaryColor),
        ),
        suffixIcon: TextButton(
          onPressed: () {
            setState(() {
              obscureText = !obscureText;
            });
          },
          child: const Text(
            "Show",
          ),
        ),
      ),
    );
  }
}
