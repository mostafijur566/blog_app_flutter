import 'package:blog_app_flutter/utils/colors.dart';
import 'package:flutter/material.dart';

class ExpandableTextWidget extends StatefulWidget {
  const ExpandableTextWidget({Key? key,
    required this.text
  }) : super(key: key);

  final String text;

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {

  late String firstHalf;
  late String secondHalf;

  bool hiddenText = true;

  double textHeight = 150;

  @override
  void initState() {
    super.initState();

    if(widget.text.length > textHeight){
      firstHalf = widget.text.substring(0, textHeight.toInt());

      secondHalf = widget.text.substring(textHeight.toInt(), widget.text.length);
    }

    else{
      firstHalf = widget.text;
      secondHalf = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty ?
      Text(
        firstHalf,
        style: TextStyle(
          color: AppColors.smallTxtColor,
          fontSize: 16,
        ),
        textAlign: TextAlign.justify,
      ) : Column(
        children: [
          Text(
            hiddenText ? (firstHalf + '...') :
            (firstHalf + secondHalf),
            style: TextStyle(
              color: AppColors.smallTxtColor,
              fontSize: 16,
            ),
            textAlign: TextAlign.justify,
          ),
          InkWell(
            onTap: (){
              setState(() {
                hiddenText = !hiddenText;
              });
            },
            child: Row(
              children: [
                Text(
                  hiddenText ? 'Show more' : 'Show less',
                  style: TextStyle(
                    color: AppColors.userNameColor,
                    fontSize: 16
                  ),
                  textAlign: TextAlign.justify,
                ),
                Icon(
                  hiddenText ? Icons.arrow_drop_down :
                      Icons.arrow_drop_up,
                  color: AppColors.userNameColor,
                )
              ],
            ),
          )
        ],
      )
    );
  }
}
