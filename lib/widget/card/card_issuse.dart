import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_github_cubit/model/issue_model.dart';

class CardIssue extends StatelessWidget {
  final IssueModel issue;
  const CardIssue({Key? key, required this.issue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      width: 100.w,
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
      child: Padding(
        padding:  EdgeInsets.all(4.0.h),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(6.0.h),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  issue.user?.avatarUrl ?? "",
                  height: 60.h,
                  width: 60.w,
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Text(
                      issue.title ?? "",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 20.sp,
                      fontWeight: FontWeight.w600),
                    ),
                  ),
                  Text(
                    issue.updatedAt ?? "",
                    style: TextStyle(fontSize: 20.sp),
                  ),
                ],
              ),
            ),
            Text(
              issue.state ?? "",
              style: TextStyle(
                  fontSize: 20.sp, color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
