import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardCategory extends StatelessWidget {
  final String text;
  final int index;
  final int selectedIndex;
  final Function(int) onClick;
  const CardCategory(
      {Key? key,
      required this.text,
      required this.index,
      required this.selectedIndex,
      required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: (){
            onClick(index);
          },
          child: Container(
            height: 20.h,
            width: 20.w,
            decoration: BoxDecoration(
                color: index != selectedIndex ? Colors.white : Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                    color: Theme.of(context).primaryColor, width: 1.w)),
          ),
        ),
        SizedBox(
          width: 5.w,
        ),
        Text(
          text,
          style: TextStyle(fontSize: 20.sp),
        )
      ],
    );
  }
}
