import 'package:blog_app_flutter/pages/post/user_post_page.dart';
import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../../widgets/account_widget.dart';
import '../../widgets/app_icon.dart';
import 'package:get/get.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: AppColors.mainColor, //change your color here
        ),
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
        child: Column(
          children: [
            AppIcon(icon: Icons.person,
              backgroundColor: AppColors.mainColor,
              iconColor: Colors.white,
              iconSize: screenWidth / 4,
              size: screenWidth / 2.5,
            ),
            Expanded(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      AccountWidget(appIcon: AppIcon(
                        icon: Icons.person,
                        backgroundColor: AppColors.mainColor,
                        iconColor: Colors.white,
                        iconSize: screenHeight * 0.015 * 5 / 2,
                        size: screenHeight * 0.01 * 5,
                      ),
                          text: 'Name'
                      ),
                      SizedBox(
                        height: screenHeight * 0.02,
                      ),
                      AccountWidget(appIcon: AppIcon(
                        icon: Icons.verified_user,
                        backgroundColor: AppColors.mainColor,
                        iconColor: Colors.white,
                        iconSize: screenHeight * 0.015 * 5 / 2,
                        size: screenHeight * 0.01 * 5,
                      ),
                          text: 'Username'
                      ),
                      GestureDetector(
                        onTap: (){
                          Get.to(UserPostPage());
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: screenHeight * 0.02),
                              child: Text(
                                'Total post 2',
                                style: TextStyle(
                                    color: AppColors.smallTxtColor,
                                    fontSize: screenHeight * 0.02
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: screenHeight * 0.02, left: screenHeight * 0.02),
                              child: Text(
                                'See all',
                                style: TextStyle(
                                    color: AppColors.mainColor,
                                    fontSize: screenHeight * 0.02
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}
