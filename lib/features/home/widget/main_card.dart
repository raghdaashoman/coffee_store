import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import '../../../core/constent/app_color.dart';
import '../data/data.dart';

class MainCard extends StatelessWidget {
  const MainCard({
    super.key,
    required this.onTap,
    required this.imageUrl,
    required this.title,
    required this.price,
  });

  final void Function()? onTap;
  final String imageUrl;
  final String title;

  final double price;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(left: 10, top: 10, right: 10),
        decoration: BoxDecoration(
          color: AppColor.containerBackground,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: CachedNetworkImage(
                width: 220.w,
                height: 190.h,
                fit: BoxFit.cover,
                imageUrl: imageUrl,
                placeholder: (context, url) =>
                    CircularProgressIndicator(color: AppColor.tabBarColor),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            SizedBox(height: 10.h,),
            Text(
              textAlign: TextAlign.center,
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColor.primary,
                fontSize: 17.sp,
                fontFamily: 'Poppins',
              ),
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(""),
                Text(
                  '$price\$',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.sp,
                    fontFamily: 'Poppins',
                    color: AppColor.primary,
                  ),
                ),
                SizedBox(width: 5),
                Icon(Icons.account_balance, color: AppColor.primary),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
