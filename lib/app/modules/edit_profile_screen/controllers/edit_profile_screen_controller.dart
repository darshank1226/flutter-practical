import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_prectical/models/user_models.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileScreenController extends GetxController {
  late final Box<UserData> userBox;
  late final UserData userData;
  final isLoading = false.obs;
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
    skillsController =
        TextEditingController(text: userData?.skills.join(',') ?? "");
    workExperienceController =
        TextEditingController(text: userData?.workExperience ?? "");
    update();
  }

  void updateProfile() async {
    isLoading.value = true;
    final userBox = await Hive.openBox<UserData>('userBox');
    final userData = userBox.get('current_user');

    final updatedUserData = UserData(
      avatarUrl: avatarImage.toString(),
      name: nameController.text,
      email: emailController.text,
      skills: userData?.skills ?? [],
      workExperience: workExperienceController.text,
    );

    userBox.put('current_user', updatedUserData);

    print("name------------${updatedUserData.name}");
    print("email------------${updatedUserData.email}");
    print("workExperience------------${updatedUserData.workExperience}");
    print("avatarUrl------------${updatedUserData.avatarUrl}");
    print("skills------------${updatedUserData.skills}");
    isLoading.value = false;
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
