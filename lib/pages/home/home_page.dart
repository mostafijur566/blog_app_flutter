import 'package:blog_app_flutter/controllers/category_controller.dart';
import 'package:blog_app_flutter/controllers/post_controller.dart';
import 'package:blog_app_flutter/routes/route_helper.dart';
import 'package:blog_app_flutter/utils/colors.dart';
import 'package:blog_app_flutter/widgets/custom_loading.dart';
import 'package:blog_app_flutter/widgets/expandable_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/comment_widget.dart';
import '../account/user_profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late String firstHalf;
  late String secondHalf;

  List<bool> hiddenText = [];

  double textHeight = 150;

  int selectedItem = 0;
  int categoryId = 1;

  loadPost(String id) async{
    await Get.find<PostController>().getPostByCategory(id);
  }

  @override
  void initState(){
    super.initState();
    loadResource();
  }

  loadResource() async{
    await Get.find<CategoryController>().getCategoryList();
    await Get.find<PostController>().getPosts();

    hiddenText = [];
    print(Get.find<PostController>().allPostsList.length);
    for(int i = 0; i < Get.find<PostController>().allPostsList.length; i++){
      hiddenText.add(true);
    }
  }

  expandableTextWidget(String text, int index){
    if(text.length > textHeight){
      firstHalf = text.substring(0, textHeight.toInt());

      secondHalf = text.substring(textHeight.toInt(), text.length);
    }

    else{
      firstHalf = text;
      secondHalf = '';
    }

    if(secondHalf.isEmpty) {
     return Text(
      firstHalf,
      style: TextStyle(
        color: AppColors.smallTxtColor,
        fontSize: 16,
      ),
      textAlign: TextAlign.justify,
    );

    } else {
      return Column(
        children: [
          Text(
            hiddenText[index] ? (firstHalf + '...') :
            (firstHalf + secondHalf),
            style: TextStyle(
              color: AppColors.smallTxtColor,
              fontSize: 16,
            ),
            textAlign: TextAlign.justify,
          ),
          InkWell(
            onTap: () {
              setState(() {
                hiddenText[index] = !hiddenText[index];
              });
            },
            child: Row(
              children: [
                Text(
                  hiddenText[index] ? 'Show more' : 'Show less',
                  style: TextStyle(
                      color: AppColors.userNameColor,
                      fontSize: 16
                  ),
                  textAlign: TextAlign.justify,
                ),
                Icon(
                  hiddenText[index] ? Icons.arrow_drop_down :
                  Icons.arrow_drop_up,
                  color: AppColors.userNameColor,
                )
              ],
            ),
          )
        ],
      );
    }
  }
  

  @override
  Widget build(BuildContext context) {

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
                Get.toNamed(RouteHelper.getPostPage());
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
            GetBuilder<CategoryController>(builder: (categories){
              return !categories.isLoading ? CustomLoading() : Container(
                height: screenHeight * 0.06,
                margin: EdgeInsets.only(
                    top: screenHeight * 0.001, bottom: screenHeight * 0.001),
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.categories.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            if(categories.categories[index].name != "All") {
                              loadPost(categories.categories[index].id.toString());
                            } else{
                              Get.find<PostController>().getPosts();
                            }
                            selectedItem = index;
                            //print(selectedItem);
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.only(
                              left: screenWidth * 0.02,
                              right: screenWidth * 0.02),
                          decoration: BoxDecoration(color: Colors.white),
                          child: Center(
                            child: Text(
                              categories.categories[index].name,
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
              );
            }),
            GetBuilder<PostController>(builder: (post){
              return Expanded(
                child: post.allPostsList.isEmpty ? Container(
                  margin: EdgeInsets.only(top: screenHeight * 0.01),
                  child: Text('No posts available!',
                    style: TextStyle(
                      color: AppColors.smallTxtColor,
                      fontSize: screenHeight * 0.02,
                    ),
                  ),
                ) : ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    //scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: post.allPostsList.length,
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
                              post.allPostsList[index].title,
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
                                      '@${post.allPostsList[index].user}',
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
                              // child: ExpandableTextWidget(text: post.allPostsList[index].body,)
                              child: Container(
                                child: expandableTextWidget(post.allPostsList[index].body, index),
                              ),
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
                                    Get.toNamed(RouteHelper.getCommentPage());
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
            })
          ],
        ),
      ),
    );
  }
}
