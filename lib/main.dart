import 'package:blog_app_flutter/controllers/auth_controller.dart';
import 'package:blog_app_flutter/controllers/category_controller.dart';
import 'package:blog_app_flutter/controllers/post_a_blog_controller.dart';
import 'package:blog_app_flutter/controllers/post_controller.dart';
import 'package:blog_app_flutter/controllers/user_controller.dart';
import 'package:blog_app_flutter/controllers/user_info_controller.dart';
import 'package:blog_app_flutter/pages/account/account_page.dart';
import 'package:blog_app_flutter/pages/account/user_profile_page.dart';
import 'package:blog_app_flutter/pages/auth/sign_in_page.dart';
import 'package:blog_app_flutter/pages/auth/sign_up_page.dart';
import 'package:blog_app_flutter/pages/comment/comment_page.dart';
import 'package:blog_app_flutter/pages/home/home_page.dart';
import 'package:blog_app_flutter/pages/home/nav_bar.dart';
import 'package:blog_app_flutter/pages/post/post_page.dart';
import 'package:blog_app_flutter/pages/post/user_post_page.dart';
import 'package:blog_app_flutter/pages/splash_screen/splash_page.dart';
import 'package:blog_app_flutter/routes/route_helper.dart';
import 'package:blog_app_flutter/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'helper/dependencies.dart' as dep;

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    Get.find<AuthController>().userLoggedIn();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Blogo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      // home: PostPage(),

      initialRoute: RouteHelper.getSplashPage(),
      getPages: RouteHelper.routes,

    );
  }
}