// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_prectical/utils/colors.dart';
import 'package:flutter_prectical/widget/button_widget.dart';

import 'package:get/get.dart';

import '../controllers/login_screen_controller.dart';

class LoginScreenView extends GetView<LoginScreenController> {
  const LoginScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Screen'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: controller.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Login',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 40),
                TextFormField(
                  controller: controller.emailController,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AppColor.primaryColor, width: 2)),
                      labelText: 'Email',
                      labelStyle: TextStyle(color: AppColor.primaryColor),
                      border: OutlineInputBorder()),
                  validator: controller.validateEmail,
                  cursorColor: AppColor.primaryColor,
                ),
                SizedBox(height: 15),
                TextFormField(
                  controller: controller.passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: AppColor.primaryColor, width: 2)),
                    labelStyle: TextStyle(color: AppColor.primaryColor),
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                  validator: controller.validatePassword,
                  cursorColor: AppColor.primaryColor,
                ),
                Row(
                  children: [
                    Obx(
                      () => Checkbox(
                        activeColor: AppColor.primaryColor,
                        value: controller.rememberMe.value,
                        onChanged: (value) =>
                            controller.toggleRememberMe(value!),
                      ),
                    ),
                    Text('Remember Me'),
                  ],
                ),
                CommonElevatedButton(
                    buttonText: "Sign in",
                    borderRadius: 0,
                    backgroundColor: AppColor.primaryColor,
                    onPressed: controller.login),
                SizedBox(height: 15),
                ElevatedButton(
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
