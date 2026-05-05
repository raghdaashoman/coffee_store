import 'package:cached_network_image/cached_network_image.dart';
import 'package:drinkable/core/constent/app_color.dart';
import 'package:drinkable/core/constent/app_image.dart';
import 'package:drinkable/features/home/data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomedetailsPage extends StatefulWidget {
  const HomedetailsPage({super.key});

  @override
  State<HomedetailsPage> createState() => _HomedetailsPageState();
}

class _HomedetailsPageState extends State<HomedetailsPage> {
  @override
  Widget build(BuildContext context) {
    var product =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      body: Stack(
        children: [
          Container(height: 1.sh, width: 1.sw),
          CachedNetworkImage(
            imageUrl: product['image'],
            placeholder: (context, url) =>
                CircularProgressIndicator(color: AppColor.primary),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColor.background,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24.r),
                  topRight: Radius.circular(24.r),
                ),
              ),
              width: 375.w,
              height: 416.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset('assets/images/home/Rectangle 569.png'),
                  ),
                  SizedBox(height: 25),
                  Text(
                    product['name'],
                    style: TextStyle(color: AppColor.primary, fontSize: 32.sp),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "${product['notes']}",
                    style: TextStyle(
                      color: AppColor.primary,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    spacing: 6.h,
                    children: [
                      Icon(Icons.star, color: AppColor.iconColor, size: 19.h),
                      Text(
                        '4.5',
                        style: TextStyle(
                          fontSize: 17.sp,
                          color: AppColor.iconColor,
                        ),
                      ),
                      Text(
                        '(10K)',
                        style: TextStyle(
                          color: AppColor.primary,
                          fontSize: 15.sp,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Size',
                    style: TextStyle(color: AppColor.primary, fontSize: 14.sp),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
