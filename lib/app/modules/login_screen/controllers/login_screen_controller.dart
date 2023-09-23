// ignore_for_file: unnecessary_null_comparison

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_prectical/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreenController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final rememberMe = false.obs;

  @override
  void onInit() async {
    super.onInit();

    final prefs = await SharedPreferences.getInstance();
    final savedEmail = prefs.getString('email');
    final savedPassword = prefs.getString('password');

    if (savedEmail != null) {
      emailController.text = savedEmail;
    }

    if (savedPassword != null) {
      passwordController.text = savedPassword;
    }
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    if (!GetUtils.isEmail(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    return null;
  }

  void toggleRememberMe(bool value) {
    rememberMe.value = value;
  }

  void login() async {
    try {
      final user = await _auth.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      if (user != null) {
        if (rememberMe.value) {
          final prefs = await SharedPreferences.getInstance();
          prefs.setString('email', emailController.text.trim());
          prefs.setString('password', passwordController.text.trim());
        }

        Get.offNamed(Routes.HOME_SCREEN);
      }
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  void googleLogin() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final results = await _auth.signInWithCredential(credential);
      debugPrint('results---------${results.toString()}');

      if (rememberMe.value) {}
    } catch (error) {}
  }
}
