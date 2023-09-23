import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileScreenController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController skillsController = TextEditingController();
  TextEditingController workExperienceController = TextEditingController();

  Rx<File?> avatarImage = Rx<File?>(null);

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
