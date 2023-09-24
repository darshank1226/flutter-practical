// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_prectical/utils/colors.dart';
import 'package:flutter_prectical/widget/button_widget.dart';
import 'package:flutter_prectical/widget/text_widget.dart';

import 'package:get/get.dart';

import '../controllers/login_screen_controller.dart';

class LoginScreenView extends GetView<LoginScreenController> {
  const LoginScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                stops: [
              0.2,
              0.5,
              0.8,
              0.7
            ],
                colors: [
              Colors.grey.shade300,
              Colors.grey.shade400,
              Colors.grey.shade700,
              Colors.grey.shade800
            ])),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: controller.formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CommonText(
                      text: "Login",
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(height: 40),
                    email_field(),
                    SizedBox(height: 20),
                    password_field(),
                    rememberme_checkbox(),
                    btn_signin(),
                    SizedBox(height: 20),
                    btn_google_signin(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget email_field() {
    return TextFormField(
      key: controller.emailFormKey,
      controller: controller.emailController,
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.primaryColor, width: 2)),
          labelText: 'Email',
          labelStyle: TextStyle(color: AppColor.primaryColor),
          border: OutlineInputBorder()),
      validator: controller.validateEmail,
      cursorColor: AppColor.primaryColor,
    );
  }

  Widget password_field() {
    return Obx(
      () => TextFormField(
        key: controller.passwordFormKey,
        controller: controller.passwordController,
        obscureText: !controller.isPasswordVisible.value,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.primaryColor, width: 2)),
          labelStyle: TextStyle(color: AppColor.primaryColor),
          border: OutlineInputBorder(),
          labelText: 'Password',
          suffixIcon: IconButton(
            onPressed: () => controller.togglePasswordVisibility(),
            icon: Icon(controller.isPasswordVisible.value
                ? Icons.visibility
                : Icons.visibility_off),
            color: AppColor.greyColor,
          ),
        ),
        validator: controller.validatePassword,
        cursorColor: AppColor.primaryColor,
      ),
    );
  }

  Widget rememberme_checkbox() {
    return Row(
      children: [
        Obx(
          () => Checkbox(
            activeColor: AppColor.primaryColor,
            value: controller.rememberMe.value,
            onChanged: (value) => controller.toggleRememberMe(value!),
          ),
        ),
        Text('Remember Me'),
      ],
    );
  }

  Widget btn_signin() {
    return CommonElevatedButton(
        buttonText: "Sign in",
        borderRadius: 0,
        backgroundColor: AppColor.primaryColor,
        onPressed: controller.login);
  }

  Widget btn_google_signin() {
    return ElevatedButton(
      onPressed: controller.googleLogin,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.primaryColor,
        minimumSize: Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/google.png',
            height: 30,
          ),
          SizedBox(width: 15),
          Text('Sign In with Google'),
        ],
      ),
    );
  }
}
