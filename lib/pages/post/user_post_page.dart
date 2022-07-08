import 'package:blog_app_flutter/controllers/query_post_controller.dart';
import 'package:blog_app_flutter/routes/route_helper.dart';
import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../../widgets/comment_widget.dart';
import '../../widgets/expandable_text_widget.dart';
import '../comment/comment_page.dart';
import 'package:get/get.dart';

class UserPostPage extends StatefulWidget {
  const UserPostPage({Key? key, required this.id}) : super(key: key);
  final String id;

  @override
  State<UserPostPage> createState() => _UserPostPageState();
}

class _UserPostPageState extends State<UserPostPage> {
  
  Future<void> loadResource() async{
    await Get.find<QueryPostController>().getData(widget.id.toString());
  }
  
  @override
  void initState() {
    super.initState();
    loadResource();
  }
  
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
        title: Text('@${widget.id.toString()}',
          style: TextStyle(
              fontSize: screenHeight * 0.028,
              color: AppColors.mainColor
          ),
        ),
        actions: [
          IconButton(
            onPressed: (){
              Get.toNamed(RouteHelper.getInitial());
            },
            icon: const Icon(Icons.home),
          ),
        ],
        centerTitle: true,
      ),

      body: GetBuilder<QueryPostController>(builder: (posts){
        return Container(
          child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              //scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: posts.allPostList.length,
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
                          posts.allPostList[index].title,
                          style: TextStyle(
                              color: AppColors.txtHeadLineColor,
                              fontSize: screenHeight * 0.025,
                              fontWeight: FontWeight.bold),
                        ),
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
                            posts.allPostList[index].body),
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
                              Get.to(CommentPage(postID: posts.allPostList[index].id,));
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
        );
      },)
    );
  }
}
