import 'package:blog_app_flutter/pages/account/account_page.dart';
import 'package:blog_app_flutter/pages/account/user_profile_page.dart';
import 'package:blog_app_flutter/pages/auth/sign_in_page.dart';
import 'package:blog_app_flutter/pages/auth/sign_up_page.dart';
import 'package:blog_app_flutter/pages/comment/comment_page.dart';
import 'package:blog_app_flutter/pages/home/nav_bar.dart';
import 'package:blog_app_flutter/pages/post/post_page.dart';
import 'package:blog_app_flutter/pages/splash_screen/splash_page.dart';
import 'package:get/get.dart';

import '../pages/post/user_post_page.dart';

class RouteHelper{
  static const splashPage = '/splash-page';
  static const initial = '/';
  static const accountPage = '/account-page';
  static const userProfilePage = '/user-profile-page';
  static const signInPage = '/sign-in-page';
  static const signUpPage = '/sign-up-page';
  static const commentPage = '/comment-page';
  static const postPage = '/post-page';
  static const userPostPage = '/user-post-page';

  static String getSplashPage() => splashPage;
  static String getInitial() => initial;
  static String getAccountPage() => accountPage;
  static String getUserProfilePage() => userProfilePage;
  static String getSignInPage() => signInPage;
  static String getSignUpPage() => signUpPage;
  static String getCommentPage() => commentPage;
  static String getPostPage() => postPage;
  static String getUserPostPage() => userPostPage;

  static List<GetPage> routes = [
    GetPage(name: splashPage, page: () => SplashPage()),
    GetPage(name: initial, page: () => NavBar()),
    GetPage(name: accountPage, page: () => AccountPage()),

    GetPage(name: userProfilePage, page: () {
      var userID = Get.parameters['userID'];
      return UserProfilePage(userID: userID!);
    }),

    GetPage(name: signInPage, page: () => SignInPage()),
    GetPage(name: signUpPage, page: () => SignUpPage()),
    GetPage(name: commentPage, page: () => CommentPage()),
    GetPage(name: postPage, page: () => PostPage()),
    GetPage(name: userPostPage, page: () => UserPostPage()),
  ];
}