import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_github_cubit/model/respository_model.dart';

class CardRepository extends StatelessWidget {
  final RepositoryModel repository;
  const CardRepository({Key? key, required this.repository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
        padding: EdgeInsets.all(6.0.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.all(6.0.h),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  repository.owner?.avatarUrl ?? "",
                  height: 60.h,
                  width: 60.w,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  repository.name ?? "",
                  style:
                      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
                ),
                Text(
                  repository.createdAt ?? "",
                  style: TextStyle(fontSize: 20.sp),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  repository.watchersCount.toString(),
                  style: TextStyle(fontSize: 20.sp,
                  color: Theme.of(context).primaryColor),
                ),
                Text(
                  repository.stargazersCount.toString(),
                  style: TextStyle(fontSize: 20.sp,
                  color: Colors.blue),
                ),
                Text(
                  repository.forksCount.toString(),
                  style: TextStyle(fontSize: 20.sp,
                  color: Colors.red),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
