import 'package:blog_app_flutter/controllers/category_controller.dart';
import 'package:blog_app_flutter/controllers/post_a_blog_controller.dart';
import 'package:blog_app_flutter/controllers/post_update_controller.dart';
import 'package:blog_app_flutter/controllers/single_post_controller.dart';
import 'package:blog_app_flutter/controllers/user_controller.dart';
import 'package:blog_app_flutter/models/post_a_blog_model.dart';
import 'package:blog_app_flutter/models/single_post_model.dart';
import 'package:blog_app_flutter/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:blog_app_flutter/helper/dependencies.dart' as dep;

import '../../routes/route_helper.dart';

class PostPage extends StatefulWidget {
  const PostPage({Key? key, this.id}) : super(key: key);

  final String? id;

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  List<dynamic> category = [];

  TextEditingController headlineController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  String? categoryId;
  var user = '';
  var title = '';
  var body = '';
  bool isLoading = false;

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

    if(widget.id!=null){
      await Get.find<SinglePostController>().getData(widget.id.toString());
      title = Get.find<SinglePostController>().title!;
      body = Get.find<SinglePostController>().body!;

      headlineController.text = title;
      bodyController.text = body;
      categoryId = Get.find<SinglePostController>().categoryId.toString();
    }

    setState(() {
      user = Get.find<UserController>().username!;
    });
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
      setState(() {
        isLoading = true;
      });

      PostABlogModel postABlogModel = PostABlogModel(user: user, categoryId: int.parse(categoryId!), title: headLine, body: body);
      postABlogController.postBlog(postABlogModel).then((status) async{
        if(status.isSuccess){
          await dep.init();
          Get.toNamed(RouteHelper.getInitial());
        }
        else{
        }
      });
    }
  }

  Future<void> updateBlog(PostUpdateController postUpdateController) async{

    String headLine;
    String body;


    headLine = headlineController.text;
    body = bodyController.text;

     if(title.isEmpty){
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
      setState(() {
        isLoading = true;
      });

      SinglePostModel singlePostModel = SinglePostModel(user: user, categoryId: int.parse(categoryId!), title: headLine, body: body);
      postUpdateController.updateData(widget.id.toString(), singlePostModel).then((status) async{
        if(status.isSuccess){
          await dep.init();
          Get.toNamed(RouteHelper.getInitial());
        }
        else{
        }
      });
    }
  }


  @override
  Widget build(BuildContext context) {

    Get.lazyPut(() => PostABlogController(postABlogRepo: Get.find()));

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return GetBuilder<PostABlogController>(builder: (postBlogController){
      return !isLoading ? Scaffold(
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
          Get.back();
        },
        icon: const Icon(CupertinoIcons.back),
      ),
      automaticallyImplyLeading: false,
      actions: [
        GestureDetector(
          onTap: () {

            var updateController = Get.find<PostUpdateController>();

            if(widget.id != null){
              updateBlog(updateController);
            }
            else{
              postBlog(postBlogController);
            }
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
          categoryId,
          category,
              (onChangedVal) {
            categoryId = onChangedVal;
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
                decoration: const InputDecoration(
                    hintText: "What's on your mind?", border: InputBorder.none),
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
    });
  }
}
