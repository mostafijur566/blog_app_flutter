import 'package:blog_app_flutter/pages/comment/comment_page.dart';
import 'package:blog_app_flutter/pages/post/post_page.dart';
import 'package:blog_app_flutter/pages/post/user_post_page.dart';
import 'package:blog_app_flutter/utils/colors.dart';
import 'package:blog_app_flutter/widgets/app_text_field.dart';
import 'package:blog_app_flutter/widgets/expandable_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../widgets/comment_text_field.dart';
import '../../widgets/comment_widget.dart';
import '../account/user_profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedItem = 0;

  @override
  Widget build(BuildContext context) {

    List<String> categories = [
      "All",
      "Food",
      "Travel",
      "Lifestyle",
      "Science",
      "Fashion"
    ];

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.dividerColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/logo.png',
              fit: BoxFit.contain,
              height: 32,
            ),
            Container(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'BLOGO',
                  style: TextStyle(
                    color: AppColors.userNameColor,
                    fontSize: screenHeight * 0.028,
                  ),
                ))
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            GestureDetector(
              onTap: (){
                Get.to(PostPage());
              },
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.only(left: screenWidth * 0.03),
                height: screenHeight * 0.057,
                width: double.maxFinite,
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/edit-icon.png',
                      width: screenHeight * 0.04,
                    ),
                    SizedBox(
                      width: screenWidth * 0.02,
                    ),
                    Text(
                      "What's on your mind?",
                      style: TextStyle(
                          color: AppColors.smallTxtColor,
                          fontSize: screenHeight * 0.02),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: screenHeight * 0.06,
              margin: EdgeInsets.only(
                  top: screenHeight * 0.001, bottom: screenHeight * 0.001),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedItem = index;
                          print(selectedItem);
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                            left: screenWidth * 0.02,
                            right: screenWidth * 0.02),
                        decoration: BoxDecoration(color: Colors.white),
                        child: Center(
                          child: Text(
                            categories[index],
                            style: TextStyle(
                                fontSize: selectedItem == index
                                    ? screenHeight * 0.025
                                    : screenHeight * 0.02,
                                color: AppColors.userNameColor,
                                fontWeight: selectedItem == index
                                    ? FontWeight.bold
                                    : FontWeight.normal),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            Expanded(
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  //scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.only(top: screenHeight * 0.015),
                      margin: EdgeInsets.only(top: screenHeight * 0.015),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.circular(screenHeight * 0.015)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: screenWidth * 0.02,
                                right: screenWidth * 0.02),
                            child: Text(
                              'Late Night Ideas',
                              style: TextStyle(
                                  color: AppColors.txtHeadLineColor,
                                  fontSize: screenHeight * 0.025,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    left: screenWidth * 0.02,
                                    right: screenWidth * 0.02),
                                child: Text(
                                  'Author',
                                  style: TextStyle(
                                    color: AppColors.smallTxtColor,
                                    fontSize: screenHeight * 0.02,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(right: screenWidth * 0.02),
                                child: GestureDetector(
                                  onTap: (){
                                    Get.to(UserProfilePage());
                                  },
                                  child: Text(
                                    '@mosta',
                                    style: TextStyle(
                                        color: AppColors.userNameColor,
                                        fontSize: screenHeight * 0.02,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: screenWidth * 0.02,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: screenWidth * 0.02,
                                right: screenWidth * 0.02),
                            child: ExpandableTextWidget(
                                text:
                                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
                          ),
                          SizedBox(
                            height: screenWidth * 0.02,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: screenWidth * 0.02,
                                right: screenWidth * 0.02),
                            child: GestureDetector(
                              onTap: () {
                                Get.to(CommentPage());
                              },
                              child: CommentWidget()
                            ),
                          ),
                          SizedBox(
                            height: screenWidth * 0.03,
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
