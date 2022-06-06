import 'package:blog_app_flutter/utils/colors.dart';
import 'package:blog_app_flutter/widgets/account_widget.dart';
import 'package:flutter/material.dart';

import '../../widgets/app_icon.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

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
        child: Column(
          children: [
            AppIcon(icon: Icons.person,
              backgroundColor: AppColors.mainColor,
              iconColor: Colors.white,
              iconSize: screenWidth / 4,
              size: screenWidth / 2.5,
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  AccountWidget(appIcon: AppIcon(
                    icon: Icons.person,
                    backgroundColor: AppColors.mainColor,
                    iconColor: Colors.white,
                    iconSize: screenHeight * 0.015 * 5 / 2,
                    size: screenHeight * 0.01 * 5,
                  ), text: 'Name'),
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
                      text: 'Username'),

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
                      text: 'Email'),

                  SizedBox(
                    height: screenHeight * 0.02,
                  ),

                  AccountWidget(appIcon: AppIcon(
                    icon: Icons.logout,
                    backgroundColor: AppColors.mainColor,
                    iconColor: Colors.white,
                    iconSize: screenHeight * 0.015 * 5 / 2,
                    size: screenHeight * 0.01 * 5,
                  ),
                      text: 'Log Out'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
