import 'package:blog_app_flutter/controllers/auth_controller.dart';
import 'package:blog_app_flutter/controllers/category_controller.dart';
import 'package:blog_app_flutter/data/api/api_client.dart';
import 'package:blog_app_flutter/data/repository/auth_repo.dart';
import 'package:blog_app_flutter/data/repository/category_repo.dart';
import 'package:blog_app_flutter/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

Future<void> init()async{

  final sharedPreferences = await SharedPreferences.getInstance();

  Get.lazyPut(() => sharedPreferences);

  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));

  Get.lazyPut(() => AuthRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(() => CategoryRepo(apiClient: Get.find()));

  Get.lazyPut(() => AuthController(authRepo: Get.find()));
  Get.lazyPut(() => CategoryController(categoryRepo: Get.find()));
}