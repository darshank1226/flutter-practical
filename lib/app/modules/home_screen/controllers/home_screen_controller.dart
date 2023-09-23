import 'package:flutter/material.dart';
import 'package:flutter_prectical/models/user_models.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeScreenController extends GetxController {
  late final Box<UserData> userBox; // Declare it as a late variable
  UserData? userData;

  final RxList selectedSkills = [].obs;

  final Map<String, Color> skillColors = {};

  @override
  void onInit() async {
    super.onInit();
    userBox =
        await Hive.openBox<UserData>('userBox'); // Initialize it in onInit
    userData = userBox.get('current_user');
    print('userData:------------- ${userData!.name.toString()}');
  }

  void setSkillColor(String skill, Color color) {
    skillColors[skill] = color;
    update();
  }
}
