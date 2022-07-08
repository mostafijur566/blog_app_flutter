import 'package:flutter/material.dart';

import '../utils/colors.dart';

class CommentWidget extends StatelessWidget {
  const CommentWidget({Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 15, bottom: 15, left: 20, right: 20),
      width: double.maxFinite,
      decoration: BoxDecoration(
          color: AppColors.dividerColor,
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              spreadRadius: 7,
              offset: const Offset(1, 10),
              color: Colors.grey.withOpacity(0.2),
            ),
          ],
          borderRadius: BorderRadius.circular(30)
      ),
      child: Row(
        children: const [
          Icon(Icons.comment,
            color: AppColors.mainColor,
          ),
          SizedBox(
            width: 10,
          ),
          Text('Write a comment', style: TextStyle(
            fontSize: 16
          ),)
        ],
      )
    );
  }
}
