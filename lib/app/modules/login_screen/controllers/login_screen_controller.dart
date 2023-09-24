// ignore_for_file: unnecessary_null_comparison

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_prectical/app/routes/app_pages.dart';
import 'package:flutter_prectical/models/user_models.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreenController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> emailFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> passwordFormKey = GlobalKey<FormState>();
  var isPasswordVisible = false.obs;
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
    const emailPattern = r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$';
    if (!RegExp(emailPattern).hasMatch(value!)) {
      return 'Please check email id';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value!.length < 8) {
      return 'Password must be 8 characters long';
    }
    return null;
  }

  void toggleRememberMe(bool value) {
    rememberMe.value = value;
  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void login() async {
    final isValid = formKey.currentState!.validate();
    if (isValid) {
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
          userDataLoad();
          Get.snackbar(
            'Login Successful',
            'You have successfully logged in.',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.grey.withOpacity(0.5),
            colorText: Colors.white,
            duration: Duration(seconds: 2),
            borderRadius: 10,
            margin: EdgeInsets.all(10),
          );

          update();
          Get.toNamed(Routes.HOME_SCREEN);
        }
      } catch (error) {
        debugPrint(error.toString());
      }
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

  void userDataLoad() async {
    UserData defaultUser = UserData(
      avatarUrl:
          'https://uxwing.com/wp-content/themes/uxwing/download/peoples-avatars/man-person-icon.png',
      name: 'Test',
      email: 'testdev@gmail.com',
      skills: [
        "Flutter",
        "Dart",
        "GetX",
        "Bloc",
        "Firebase",
        "Stripe",
        "Agora",
        "Twillio",
        "Hive",
        "Google Map API"
      ],
      workExperience: '5',
    );
    final userBox = await Hive.openBox<UserData>('userBox');
    userBox.put('current_user', defaultUser);
  }
}
