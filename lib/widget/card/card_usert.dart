import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_github_cubit/model/user_moder.dart';

class CardUser extends StatelessWidget {
  final UserModel user;
  const CardUser({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(4.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
       
          Padding(
            padding: EdgeInsets.all(6.0.h),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                user.avatarUrl ?? "",
                height: 60.h,
                width: 60.w,
              ),
            ),
          ),
          Text(
            user.login.toString(),
            style: TextStyle(fontSize: 20.sp),
          )
        ],
      ),
    );
  }
}
