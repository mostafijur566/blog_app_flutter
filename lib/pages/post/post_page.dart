import 'package:blog_app_flutter/controllers/category_controller.dart';
import 'package:blog_app_flutter/controllers/post_a_blog_controller.dart';
import 'package:blog_app_flutter/controllers/user_controller.dart';
import 'package:blog_app_flutter/models/post_a_blog_model.dart';
import 'package:blog_app_flutter/utils/colors.dart';
import 'package:blog_app_flutter/widgets/custom_loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:blog_app_flutter/helper/dependencies.dart' as dep;

import '../../routes/route_helper.dart';

class PostPage extends StatefulWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  List<dynamic> category = [];

  TextEditingController headlineController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  String? categoryId;
  var user = '';

  var categories = Get.find<CategoryController>().categories;

  @override
  void initState() {
    super.initState();
    category = [];
    for (int i = 0; i < categories.length; i++) {
      category.add({"id": categories[i].id, "name": categories[i].name});
    }
    category.removeAt(0);
    loadResource();
  }

  Future<void>loadResource() async{
    await Get.find<UserController>().getUserInfo();
    setState(() {
      user = Get.find<UserController>().username!;
    });
    print(user);
    await dep.init();
  }

  Future<void> postBlog(PostABlogController postABlogController) async{
    String headLine;
    String body;


    headLine = headlineController.text;
    body = bodyController.text;

    if(categoryId == null){
      Get.snackbar('Oops!', 'Please select a category!',
        colorText: Colors.white,
        backgroundColor: Colors.redAccent
      );
    }

    else if(headLine.isEmpty){
      Get.snackbar('Oops!', 'Head line field cannot be empty',
          colorText: Colors.white,
          backgroundColor: Colors.redAccent
      );
    }
    else if (body.isEmpty){
      Get.snackbar('Oops!', 'Body field cannot be empty',
          colorText: Colors.white,
          backgroundColor: Colors.redAccent
      );
    }
    else{
      PostABlogModel postABlogModel = PostABlogModel(user: user, categoryId: int.parse(categoryId!), title: headLine, body: body);
      postABlogController.postBlog(postABlogModel).then((status) async{
        if(status.isSuccess){
          await dep.init();
          Get.offNamed(RouteHelper.getInitial());
        }
        else{
          print(status.message);
        }
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return WillPopScope(
        onWillPop: () async{
          Get.offNamed(RouteHelper.getInitial());
          return true;
        },
        child: GetBuilder<PostABlogController>(builder: (postBlogController){
      return !postBlogController.isLoading ? Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: AppColors.mainColor, //change your color here
          ),
          backgroundColor: Colors.white,
          title: Text(
            'Create post',
            style: TextStyle(color: AppColors.userNameColor),
          ),
          leading:  IconButton(
            onPressed: () async{
              Get.offNamed(RouteHelper.getInitial());
            },
            icon: const Icon(CupertinoIcons.back),
          ),
          automaticallyImplyLeading: false,
          actions: [
            GestureDetector(
              onTap: () {
                postBlog(postBlogController);
              },
              child: Row(
                children: [
                  Text(
                    'POST',
                    style: TextStyle(
                        color: AppColors.userNameColor,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: screenWidth * 0.015,),
                  Icon(
                    Icons.post_add,
                    color: AppColors.userNameColor,
                  ),
                  SizedBox(width: screenWidth * 0.015,),
                ],
              ),
            )
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: screenHeight * 0.02,
                  left: screenHeight * 0.01,
                  bottom: screenHeight * 0.02),
              child: Text(
                user.isEmpty ? '' :'@$user',
                style: TextStyle(
                    color: AppColors.userNameColor,
                    fontSize: screenWidth * 0.04,
                    fontWeight: FontWeight.bold),
              ),
            ),
            FormHelper.dropDownWidgetWithLabel(
              context,
              "Category",
              "Select category",
              this.categoryId,
              this.category,
                  (onChangedVal) {
                categoryId = onChangedVal;
                print(categoryId);
              },
                  (onValidate) {
                if (onValidate == null) {
                  return 'Please select category';
                }
                return null;
              },
              borderColor: AppColors.mainColor,
              borderFocusColor: AppColors.mainColor,
              borderRadius: 10,
              optionValue: "id",
              optionLabel: "name",
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            TextField(
              minLines: 1,
              maxLines: 3,
              controller: headlineController,
              decoration: InputDecoration(
                hintText: "Head line",
                focusedBorder: OutlineInputBorder(
                  borderSide:
                  BorderSide(width: 1.0, color: AppColors.userNameColor),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                  BorderSide(width: 1.0, color: AppColors.userNameColor),
                ),
              ),
            ),
            Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                      left: screenWidth * 0.02, right: screenWidth * 0.02),
                  child: TextField(
                    expands: true,
                    maxLines: null,
                    controller: bodyController,
                    textAlign: TextAlign.justify,
                    decoration: InputDecoration(
                        hintText: "What's on you mind?", border: InputBorder.none),
                  ),
                ))
          ],
        ),
      ) : Scaffold(
        body: Center(
          child: Container(
            color: Colors.white,
            width: double.maxFinite,
            child: SpinKitSpinningLines(
              color: AppColors.mainColor,
            ),
          ),
        ),
      );
    }));
  }
}
