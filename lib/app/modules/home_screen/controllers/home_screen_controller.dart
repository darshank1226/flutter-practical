import 'package:flutter/widgets.dart';
import 'package:flutter_prectical/models/user_models.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeScreenController extends GetxController {
  late final Box<UserData> userBox;
  UserData? userData;

  @override
  void onInit() async {
    super.onInit();
    userBox = await Hive.openBox<UserData>('userBox');
    userData = userBox.get('current_user');

    debugPrint('----data update----');
    update();
  }
}
