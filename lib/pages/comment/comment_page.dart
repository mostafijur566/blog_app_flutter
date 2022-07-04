import 'package:blog_app_flutter/controllers/do_comment_controller.dart';
import 'package:blog_app_flutter/controllers/get_comment_controller.dart';
import 'package:blog_app_flutter/controllers/user_controller.dart';
import 'package:blog_app_flutter/models/do_comment_model.dart';
import 'package:blog_app_flutter/pages/account/user_profile_page.dart';
import 'package:blog_app_flutter/utils/colors.dart';
import 'package:blog_app_flutter/widgets/comment_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CommentPage extends StatefulWidget {
  CommentPage({Key? key, required this.postID,}) : super(key: key);

  final int postID;

  @override
  State<CommentPage> createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {

  TextEditingController commentController = TextEditingController();

  var user;

  @override
  void initState(){
    super.initState();
    loadResource();
  }

  Future<void> loadResource() async{
    await Get.find<UserController>().getUserInfo();
    await Get.find<GetCommentController>().getComments(widget.postID.toString());
    user = Get.find<UserController>().username!;
  }

  Future<void> doComment(DoCommentController doCommentController) async{
    String comment;
    int postID;
    String userID;

    userID = user;

    comment = commentController.text;
    postID = widget.postID;

    if(comment.isEmpty){
      Get.snackbar('Oops!', 'Comment field cannot be empty',
          colorText: Colors.white,
          backgroundColor: Colors.redAccent
      );
    }

    else{
      DoCommentModel doCommentModel = DoCommentModel(postID: postID, userID: userID, comment: comment);
      doCommentController.doComment(doCommentModel).then((status) async{
        if(status.isSuccess){
          print('success');
        }
        else{
          print(status.message);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    print(widget.postID);

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
                        controller: commentController,
                          hintText: 'Write your comment', icon: Icons.comment),
                    ),
                    SizedBox(
                      width: screenWidth * 0.04,
                    ),
                    GetBuilder<DoCommentController>(builder: (comment){
                      return IconButton(
                        onPressed: (){
                          doComment(comment);
                          loadResource();
                          commentController.clear();
                        },
                        icon: Icon(
                          Icons.send,
                          color: AppColors.userNameColor,
                        ),
                      );
                    })
                  ],
                ),
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              GetBuilder<GetCommentController>(builder: (allComments){
                return !allComments.isLoading ? Expanded(
                  child: Center(
                    child: SpinKitFadingCube(
                      color: AppColors.mainColor,
                    ),
                  ),
                ) : Expanded(
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: allComments.comments.length,
                    itemBuilder: (context, index) {
                      return Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: screenHeight * 0.02,
                            ),
                            GestureDetector(
                              onTap: (){
                                //TODO: need to pass parameters
                                Get.to(UserProfilePage(userID: allComments.comments[index].userId,));
                              },
                              child: Text(
                                '@${allComments.comments[index].userId!}',
                                style: TextStyle(
                                    color: AppColors.userNameColor,
                                    fontSize: screenWidth * 0.04,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                            SizedBox(
                              height: screenHeight * 0.005,
                            ),
                            Text(allComments.comments[index].comment,
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
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
