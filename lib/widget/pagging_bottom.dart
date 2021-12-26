import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaggingBottom extends StatelessWidget {
  final int numb;
  final Function(int) onClick;
  const PaggingBottom({Key? key, required this.numb, required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onClick(numb);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Padding(
          padding:  EdgeInsets.only(left:6.0.w, right: 6.w),
          child: Text(
            '$numb',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24.sp,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
    );
  }
}
