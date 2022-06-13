import 'package:blog_app_flutter/controllers/auth_controller.dart';
import 'package:blog_app_flutter/controllers/category_controller.dart';
import 'package:blog_app_flutter/controllers/post_a_blog_controller.dart';
import 'package:blog_app_flutter/controllers/post_controller.dart';
import 'package:blog_app_flutter/controllers/user_controller.dart';
import 'package:blog_app_flutter/data/api/api_client.dart';
import 'package:blog_app_flutter/data/repository/auth_repo.dart';
import 'package:blog_app_flutter/data/repository/category_repo.dart';
import 'package:blog_app_flutter/data/repository/post_a_blog_repo.dart';
import 'package:blog_app_flutter/data/repository/post_repo.dart';
import 'package:blog_app_flutter/data/repository/user_repo.dart';
import 'package:blog_app_flutter/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

Future<void> init()async{

  final sharedPreferences = await SharedPreferences.getInstance();

  Get.lazyPut(() => sharedPreferences);

  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));

  Get.lazyPut(() => AuthRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(() => CategoryRepo(apiClient: Get.find()));
  Get.lazyPut(() => PostRepo(apiClient: Get.find()));
  Get.lazyPut(() => UserRepo(apiClient: Get.find()));
  Get.lazyPut(() => PostABlogRepo(apiClient: Get.find()));


  Get.lazyPut(() => AuthController(authRepo: Get.find()));
  Get.lazyPut(() => CategoryController(categoryRepo: Get.find()));
  Get.lazyPut(() => PostController(postRepo: Get.find()));
  Get.lazyPut(() => UserController(userRepo: Get.find()));
  Get.lazyPut(() => PostABlogController(postABlogRepo: Get.find()));
}