import 'package:blog_app_flutter/utils/colors.dart';
import 'package:flutter/material.dart';

class PostPage extends StatelessWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Create post',
          style: TextStyle(color: AppColors.userNameColor),
        ),
        actions: [
          Row(
            children: [
              Text('POST',
                style: TextStyle(color: AppColors.userNameColor,
                  fontWeight: FontWeight.bold
                ),
              ),
              IconButton(onPressed: (){

              },
                  icon: Icon(Icons.post_add, color: AppColors.userNameColor,),
              ),
            ],
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: screenHeight * 0.02, left: screenHeight * 0.01, bottom: screenHeight * 0.02),
            child: Text('@Mosta',
              style: TextStyle(
                  color: AppColors.userNameColor,
                  fontSize: screenWidth * 0.04,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          TextField(
            minLines: 1,
            maxLines: 3,
            decoration: InputDecoration(
                hintText: "Head line",
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 1.0,
                    color: AppColors.userNameColor
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 1.0,
                      color: AppColors.userNameColor
                  ),
                ),
            ),
          ),
          Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: screenWidth * 0.02, right: screenWidth * 0.02),
                child: TextField(
                  expands: true,
                  maxLines: null,
                  textAlign: TextAlign.justify,
                  decoration: InputDecoration(
                    hintText: "What's on you mind?",
                    border: InputBorder.none
                  ),
                ),
              )
          )
        ],
      )
    );
  }
}
