import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  final RxList availableSkills = [
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
  ].obs;

  final RxList selectedSkills = [].obs;
  final Map<String, Color> skillColors = {};

  @override
  void onInit() {
    super.onInit();
    for (final skill in availableSkills) {
      skillColors[skill] = Colors.grey;
    }
  }

  void setSkillColor(String skill, Color color) {
    skillColors[skill] = color;
    update();
  }
}
