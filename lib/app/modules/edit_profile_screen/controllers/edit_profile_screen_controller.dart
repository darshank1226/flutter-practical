import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_prectical/models/user_models.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileScreenController extends GetxController {
  Box<UserData>? userBox;
  final isLoading = false.obs;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final skillsController = TextEditingController();
  final workExperienceController = TextEditingController();

  final avatarImage = Rx<File?>(null);

  @override
  void onInit() async {
    super.onInit();
    userBox = await Hive.openBox<UserData>('userBox');
    final userData = userBox!.get('current_user');

    nameController.text = userData?.name ?? "";
    emailController.text = userData?.email ?? "";
    skillsController.text = userData?.skills.join(',') ?? "";
    workExperienceController.text = userData?.workExperience ?? "";
  }

  void updateProfile() async {
    final userData = userBox!.get('current_user');

    final updatedUserData = UserData(
      avatarUrl: avatarImage.value?.toString() ?? userData?.avatarUrl ?? "",
      name: nameController.text,
      email: emailController.text,
      skills: userData?.skills ?? [],
      workExperience: workExperienceController.text,
    );

    userBox!.put('current_user', updatedUserData);

    debugPrint("name------------${updatedUserData.name}");
    debugPrint("email------------${updatedUserData.email}");
    debugPrint("workExperience------------${updatedUserData.workExperience}");
    debugPrint("avatarUrl------------${updatedUserData.avatarUrl}");
    debugPrint("skills------------${updatedUserData.skills}");
  }

  void setAvatarImage(image) {
    avatarImage.value = image;
  }

  Future<void> pickupImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setAvatarImage(File(pickedFile.path));
    }
  }
}
