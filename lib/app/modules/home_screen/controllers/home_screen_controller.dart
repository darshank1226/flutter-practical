import 'package:flutter/widgets.dart'; // Import your UserData model
import 'package:flutter_prectical/models/user_models.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeScreenController extends GetxController {
  Box<UserData>? userBox;
  Rx<UserData?> userData = Rx<UserData?>(null);
  @override
  void onInit() {
    super.onInit();
    getUserData();
    debugPrint('----dataupdate----');
  }

  void getUserData() async {
    userBox = await Hive.openBox<UserData>('userBox');
    userData.value = userBox!.get('current_user');
    debugPrint("---name${userData.value!.name}");
  }
}
