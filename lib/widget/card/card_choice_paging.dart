import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardChoicePaging extends StatelessWidget {
  final String text;
  final int index;
  final int selectedIndex;
  final Function(int) onClick;
  const CardChoicePaging(
      {Key? key,
      required this.text,
      required this.index,
      required this.selectedIndex,
      required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onClick(index);
      },
      child: Padding(
        padding: EdgeInsets.only(right: 5.0.h),
        child: Container(
          decoration: BoxDecoration(
              color: index != selectedIndex
                  ? Colors.white
                  : Theme.of(context).primaryColor,
              border:
                  Border.all(color: Theme.of(context).primaryColor, width: 1.w),
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: EdgeInsets.all(8.0.h),
            child: Text(
              text,
              style: TextStyle(
                  color:
                      index == selectedIndex ? Colors.white : Colors.grey[600]),
            ),
          ),
        ),
      ),
    );
  }
}
