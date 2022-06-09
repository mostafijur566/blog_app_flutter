import 'dart:async';

import 'package:blog_app_flutter/routes/route_helper.dart';
import 'package:blog_app_flutter/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin{

  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState(){
    super.initState();
    controller = AnimationController(vsync: this, duration: const Duration(seconds: 2))..forward();

    animation = CurvedAnimation(parent: controller, curve: Curves.linear);

    Timer(
      const Duration(seconds: 3),
        () => Get.offNamed(RouteHelper.getSignInPage())
    );
  }

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ScaleTransition(
            scale: animation,
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/logo.png',),
              backgroundColor: Colors.white,
              radius: screenHeight * 0.1,
            ),
          ),
          SizedBox(
            height: screenHeight * 0.02,
          ),
          Container(
            width: double.maxFinite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Welcome to ",
                  style: TextStyle(
                      fontFamily: 'KdamThmorPro',
                      color: Colors.white,
                      fontSize: screenHeight * 0.045
                  ),
                ),
                Text(
                  "BLOGO",
                  style: TextStyle(
                      fontFamily: 'KdamThmorPro',
                      color: Colors.white,
                      fontSize: screenHeight * 0.045,
                    fontWeight: FontWeight.bold
                  ),
                )
              ],
            ),
          ),

        ],
      ),
    );
  }
}
