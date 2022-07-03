import 'package:blog_app_flutter/controllers/user_info_controller.dart';
import 'package:blog_app_flutter/pages/post/user_post_page.dart';
import 'package:blog_app_flutter/widgets/custom_loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../routes/route_helper.dart';
import '../../utils/colors.dart';
import '../../widgets/account_widget.dart';
import '../../widgets/app_icon.dart';
import 'package:get/get.dart';

class UserProfilePage extends StatefulWidget {
  UserProfilePage({Key? key, required this.userID}) : super(key: key);
  final String userID;

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {


  @override
  void initState(){
    super.initState();
    loadResource(widget.userID);
  }

  Future<void>loadResource(String user) async{
    await Get.find<UserInfoController>().getUserInfo(user);
  }

  @override
  Widget build(BuildContext context) {

    Get.lazyPut(() => UserInfoController(userInfoRepo: Get.find()));
    
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: AppColors.mainColor, //change your color here
        ),
        backgroundColor: Colors.white,
        leading:  IconButton(
          onPressed: () async{
            Get.back();
          },
          icon: const Icon(CupertinoIcons.back),
        ),
        automaticallyImplyLeading: false,
        title: Text('Profile',
          style: TextStyle(
              fontSize: screenHeight * 0.028,
              color: AppColors.mainColor
          ),
        ),
        centerTitle: true,
      ),

      body: GetBuilder<UserInfoController>(builder: (userInfo){
        return Container(
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
              !userInfo.isLoading ? CustomLoading() : Expanded(
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
                            text: userInfo.name == null ? '' : userInfo.name!
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
                            text: userInfo.username == null ? '' : userInfo.username!
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
                                  userInfo.totalPost == null ? '' : 'Total post ${userInfo.totalPost.toString()}',
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
        );
      })
    );
  }
}
