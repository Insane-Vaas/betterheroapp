import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../routes/google_auth.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Duration get loginTime => Duration(milliseconds: 2250);

  Future<String?> signIn(LoginData loginData) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: loginData.name,
        password: loginData.password,
      );
      print(userCredential);
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        return "User Not Found";
      }
    }
    return null;
  }

  Future<String?> signUp(SignupData signupData) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: signupData.name.toString(),
              password: signupData.password.toString());
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        return "User with same email exists";
      }
    }
    return null;
  }

  Future<String?> onSignUp(SignupData) async {
    String? str = await signUp(SignupData);
    return str;
  }

  Future<String?> onLogin(loginData) async {
    String? str = await signIn(loginData);

    return str;
  }

  LoginTheme loginTheme() {
    return LoginTheme(
      primaryColor: Colors.blueGrey.shade300,
      accentColor: Colors.grey.shade200,
      titleStyle: TextStyle(
        color: Colors.orange.shade400,
      ),
      buttonStyle: TextStyle(
        color: Colors.black,
        fontSize: 20,
      ),
      buttonTheme:
          LoginButtonTheme(backgroundColor: Colors.white, elevation: 10),
      textFieldStyle: TextStyle(
        color: Colors.black,
      ),
      bodyStyle: TextStyle(
        color: Colors.black,
      ),
      footerTextStyle: TextStyle(
        height: 11,
        fontSize: 22,
        color: Colors.orange.shade600,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      footer: "One click to save the world.",
      title: "Better Hero",
      loginProviders: [
        LoginProvider(
          icon: FontAwesomeIcons.google,
          label: "Google",
          animated: true,
          callback: () async {
            try {
              final provider =
                  Provider.of<GoogleSignInProvider>(context, listen: false);
              Future.delayed(Duration(seconds: 5));
              final user = await provider.googleLogin();
              print(user);
              if (user == null) return "Login error";

              return null;
            } catch (e) {
              print(e);
            }
          },
        ),
        LoginProvider(
          icon: FontAwesomeIcons.phone,
          label: "Phone",
          animated: true,
          callback: () {
            context.pushNamed("phonelogin");
          },
        ),
      ],
      theme: loginTheme(),
      onLogin: onLogin,
      logo: AssetImage(
        "images/betterHeroLogo.png",
      ),
      onRecoverPassword: (p0) => null,
      onSignup: onSignUp,
      onSubmitAnimationCompleted: () {
        setState(() {});
        context.goNamed("home");
      },
    );
  }
}
