import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_prectical/models/user_models.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileScreenController extends GetxController {
  late final Box<UserData> userBox;
  late final UserData userData;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController skillsController = TextEditingController();
  TextEditingController workExperienceController = TextEditingController();

  Rx<File?> avatarImage = Rx<File?>(null);

  @override
  void onInit() async {
    super.onInit();
    final userBox = await Hive.openBox<UserData>('userBox');
    final userData = userBox.get('current_user');

    nameController = TextEditingController(text: userData?.name ?? "");
    emailController = TextEditingController(text: userData?.email ?? "");

    workExperienceController =
        TextEditingController(text: userData?.workExperience ?? "");
  }

  void updateProfile() async {
    final userBox = await Hive.openBox<UserData>('userBox');
    final userData = userBox.get('current_user');

    // Create an updated user data object
    final updatedUserData = UserData(
      avatarUrl: avatarImage.toString(),
      name: nameController.text,
      email: emailController.text,
      skills: userData?.skills ?? [],
      workExperience: workExperienceController.text,
    );

    // Update the user data in Hive
    userBox.put('current_user', updatedUserData);
  }

  void setAvatarImage(File image) {
    avatarImage.value = image;
  }

  Future<void> pickupImage() async {
    final XFile? pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setAvatarImage(File(pickedFile.path));
    }
  }
}
