import 'package:blog_app_flutter/controllers/auth_controller.dart';
import 'package:blog_app_flutter/controllers/category_controller.dart';
import 'package:blog_app_flutter/controllers/do_comment_controller.dart';
import 'package:blog_app_flutter/controllers/get_comment_controller.dart';
import 'package:blog_app_flutter/controllers/post_a_blog_controller.dart';
import 'package:blog_app_flutter/controllers/post_controller.dart';
import 'package:blog_app_flutter/controllers/post_delete_controller.dart';
import 'package:blog_app_flutter/controllers/post_update_controller.dart';
import 'package:blog_app_flutter/controllers/query_post_controller.dart';
import 'package:blog_app_flutter/controllers/single_post_controller.dart';
import 'package:blog_app_flutter/controllers/user_controller.dart';
import 'package:blog_app_flutter/controllers/user_info_controller.dart';
import 'package:blog_app_flutter/data/api/api_client.dart';
import 'package:blog_app_flutter/data/repository/auth_repo.dart';
import 'package:blog_app_flutter/data/repository/category_repo.dart';
import 'package:blog_app_flutter/data/repository/do_comment_repo.dart';
import 'package:blog_app_flutter/data/repository/get_comment_repo.dart';
import 'package:blog_app_flutter/data/repository/post_a_blog_repo.dart';
import 'package:blog_app_flutter/data/repository/post_delete_repo.dart';
import 'package:blog_app_flutter/data/repository/post_repo.dart';
import 'package:blog_app_flutter/data/repository/post_update_repo.dart';
import 'package:blog_app_flutter/data/repository/query_post_repo.dart';
import 'package:blog_app_flutter/data/repository/single_post_repo.dart';
import 'package:blog_app_flutter/data/repository/user_info_repo.dart';
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
  Get.lazyPut(() => UserInfoRepo(apiClient: Get.find()));
  Get.lazyPut(() => DoCommentRepo(apiClient: Get.find()));
  Get.lazyPut(() => GetCommentRepo(apiClient: Get.find()));
  Get.lazyPut(() => SinglePostRepo(apiClient: Get.find()));
  Get.lazyPut(() => PostUpdateRepo(apiClient: Get.find()));
  Get.lazyPut(() => PostDeleteRepo(apiClient: Get.find()));
  Get.lazyPut(() => QueryPostRepo(apiClient: Get.find()));

  Get.lazyPut(() => AuthController(authRepo: Get.find()));
  Get.lazyPut(() => CategoryController(categoryRepo: Get.find()), fenix: true);
  Get.lazyPut(() => PostController(postRepo: Get.find()), fenix: true);
  Get.lazyPut(() => UserController(userRepo: Get.find()), fenix: true);
  Get.lazyPut(() => PostABlogController(postABlogRepo: Get.find()), fenix: true);
  Get.lazyPut(() => UserInfoController(userInfoRepo: Get.find()), fenix: true);
  Get.lazyPut(() => DoCommentController(doCommentRepo: Get.find()), fenix: true);
  Get.lazyPut(() => GetCommentController(getCommentRepo: Get.find()), fenix: true);
  Get.lazyPut(() => SinglePostController(singlePostRepo: Get.find()), fenix: true);
  Get.lazyPut(() => PostUpdateController(postUpdateRepo: Get.find()), fenix: true);
  Get.lazyPut(() => PostDeleteController(postDeleteRepo: Get.find()));
  Get.lazyPut(() => QueryPostController(queryPostRepo: Get.find()), fenix: true);
}