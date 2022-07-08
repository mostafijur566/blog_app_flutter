import 'package:blog_app_flutter/controllers/auth_controller.dart';
import 'package:blog_app_flutter/controllers/user_controller.dart';
import 'package:blog_app_flutter/routes/route_helper.dart';
import 'package:blog_app_flutter/utils/colors.dart';
import 'package:blog_app_flutter/widgets/account_widget.dart';
import 'package:blog_app_flutter/widgets/text_field_loading.dart';
import 'package:flutter/material.dart';

import '../../widgets/app_icon.dart';
import 'package:get/get.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {

  @override
  void initState(){
    super.initState();
    loadResource();
  }

  Future<void>loadResource() async{
    await Get.find<UserController>().getUserInfo();
  }

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Profile',
          style: TextStyle(
            fontSize: screenHeight * 0.028,
            color: AppColors.mainColor
          ),
        ),
        centerTitle: true,
      ),

      body: Container(
        width: double.maxFinite,
        margin: EdgeInsets.only(top: screenHeight * 0.02),
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppIcon(icon: Icons.person,
                backgroundColor: AppColors.mainColor,
                iconColor: Colors.white,
                iconSize: screenWidth / 4.5,
                size: screenWidth / 3,
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              GetBuilder<UserController>(builder: (userInfo){
                return !userInfo.isLoading ? const TextFieldLoading() :
                Column(
                  children: [
                    AccountWidget(appIcon: AppIcon(
                      icon: Icons.person,
                      backgroundColor: AppColors.mainColor,
                      iconColor: Colors.white,
                      iconSize: screenHeight * 0.015 * 5 / 2,
                      size: screenHeight * 0.01 * 5,
                    ), text: userInfo.name.toString()),
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),
                    AccountWidget(appIcon: AppIcon(
                      icon: Icons.verified_user,
                      backgroundColor: AppColors.iconColor,
                      iconColor: Colors.white,
                      iconSize: screenHeight * 0.015 * 5 / 2,
                      size: screenHeight * 0.01 * 5,
                    ),
                        text: userInfo.username.toString()),

                    SizedBox(
                      height: screenHeight * 0.02,
                    ),

                    AccountWidget(appIcon: AppIcon(
                      icon: Icons.email,
                      backgroundColor: AppColors.iconColor,
                      iconColor: Colors.white,
                      iconSize: screenHeight * 0.015 * 5 / 2,
                      size: screenHeight * 0.01 * 5,
                    ),
                        text: userInfo.email.toString()),


                    SizedBox(
                      height: screenHeight * 0.02,
                    ),

                    GestureDetector(
                      onTap: () async{
                        await Get.find<AuthController>().clearToken();
                        Get.deleteAll();
                        Get.toNamed(RouteHelper.getSignInPage());
                      },
                      child: AccountWidget(appIcon: AppIcon(
                        icon: Icons.logout,
                        backgroundColor: AppColors.mainColor,
                        iconColor: Colors.white,
                        iconSize: screenHeight * 0.015 * 5 / 2,
                        size: screenHeight * 0.01 * 5,
                      ),
                          text: 'Sign Out'),
                    ),
                  ],
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
