import 'package:flutter/material.dart';

import 'app_icon.dart';

class AccountWidget extends StatelessWidget {
  AppIcon appIcon;
  String text;
  TextOverflow overflow;
  Color ? color;
  double size;
  AccountWidget({Key? key, required this.appIcon,
    this.overflow = TextOverflow.ellipsis,
    this.color,
    this.size = 0,
    required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20,
      top: 10,
        bottom: 10
      ),

      decoration: BoxDecoration(
          color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 5),
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 2
          ),
        ]
      ),
      child: Row(
        children: [
          appIcon,
          const SizedBox(width:20,),
          Flexible(
            child: Text(text,
              maxLines: 1,
              overflow: overflow,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.w400,
                fontSize: size == 0 ? 20 : size
              ),
            ),
          )
        ],
      ),
    );
  }
}
