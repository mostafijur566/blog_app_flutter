import 'package:blog_app_flutter/utils/colors.dart';
import 'package:blog_app_flutter/widgets/comment_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommentPage extends StatelessWidget {
  const CommentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(
              top: screenHeight * 0.02,
              left: screenHeight * 0.02,
              right: screenHeight * 0.02),
          child: Column(
            children: [
              Container(
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                        Get.back();
                      },
                      child: Container(
                        padding: EdgeInsets.only(right: screenHeight * 0.01, top: screenHeight * 0.01, bottom: screenHeight * 0.01,),
                        child: Icon(
                          CupertinoIcons.chevron_back,
                          color: AppColors.mainColor,
                        ),
                      ),
                    ),
                    Expanded(
                      child: CommentTextField(
                          hintText: 'Write your comment', icon: Icons.comment),
                    ),
                    SizedBox(
                      width: screenWidth * 0.04,
                    ),
                    Icon(
                      Icons.send,
                      color: AppColors.userNameColor,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              Expanded(
                child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: screenHeight * 0.02,
                            ),
                            Text('@Mosta',
                              style: TextStyle(
                                color: AppColors.userNameColor,
                                fontSize: screenWidth * 0.04,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            SizedBox(
                              height: screenHeight * 0.005,
                            ),
                            Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. ",
                              style: TextStyle(
                                fontSize: screenHeight * 0.019,
                                color: AppColors.smallTxtColor
                              ),
                              textAlign: TextAlign.justify,
                            ),
                            SizedBox(
                              height: screenHeight * 0.02,
                            ),
                            Divider(
                              thickness: 1,
                              color: AppColors.dividerColor,
                            )
                          ],
                        ),
                      );
                    },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
