import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../../widgets/comment_widget.dart';
import '../../widgets/expandable_text_widget.dart';
import '../comment/comment_page.dart';
import 'package:get/get.dart';

class UserPostPage extends StatelessWidget {
  const UserPostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(

      backgroundColor: AppColors.dividerColor,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: AppColors.mainColor, //change your color here
        ),
        backgroundColor: Colors.white,
        title: Text('@mosta',
          style: TextStyle(
              fontSize: screenHeight * 0.028,
              color: AppColors.mainColor
          ),
        ),
        centerTitle: true,
      ),

      body: Container(
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
        //scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: 2,
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
                      child: Text(
                        '@mosta',
                        style: TextStyle(
                            color: AppColors.userNameColor,
                            fontSize: screenHeight * 0.02,
                            fontWeight: FontWeight.bold),
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
    );
  }
}
