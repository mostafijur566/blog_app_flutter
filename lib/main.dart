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
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
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
      home: SignUpPage(),
    );
  }
}