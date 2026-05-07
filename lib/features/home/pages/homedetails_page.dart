import 'package:cached_network_image/cached_network_image.dart';
import 'package:drinkable/core/constent/app_color.dart';
import 'package:drinkable/core/constent/app_image.dart';
import 'package:drinkable/features/home/data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomedetailsPage extends StatefulWidget {
  const HomedetailsPage({super.key});

  @override
  State<HomedetailsPage> createState() => _HomedetailsPageState();
}

class _HomedetailsPageState extends State<HomedetailsPage> {
  @override
  int selectedValue = 100;

  Widget build(BuildContext context) {
    var product =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      body: Stack(
        children: [
          Container(height: 1.sh, width: 1.sw),
          CachedNetworkImage(
            imageUrl: product['image'],
            width: 1.sw,
            height: 1.sh,
            fit: BoxFit.cover,
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
                        "${product['price']}",
                        style: TextStyle(
                          fontSize: 17.sp,
                          color: AppColor.iconColor,
                        ),
                      ),
                      SizedBox(width: 5),
                      Text(
                        "(${product['id']}k)",
                        style: TextStyle(
                          color: AppColor.primary,
                          fontSize: 15.sp,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    'Size',
                    style: TextStyle(color: AppColor.primary, fontSize: 14.sp),
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [250, 350, 450].map((value) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 4.w,
                          vertical: 10.h,
                        ),
                        child: ChoiceChip(
                          side: BorderSide(
                            color: selectedValue == value
                                ? AppColor.iconColor
                                : Colors.grey,
                          ),
                          backgroundColor: AppColor.containerBackground,
                          color: WidgetStatePropertyAll(Color(0xff3C2C26)),
                          selectedColor: AppColor.containerBackground,
                          selected: (selectedValue == value),
                          onSelected: (isSelected) {
                            setState(() {
                              selectedValue = value;
                            });
                          },
                          showCheckmark: false,
                          label: Container(
                            width: 65.w,
                            height: 30.h,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SvgPicture.asset(AppImage.homeDetailsCup),
                                SizedBox(width: 5.w),
                                Text(
                                  "$value",
                                  style: TextStyle(color: AppColor.primary),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.add, color: AppColor.primary),
                        style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                            AppColor.containerBackground,
                          ),
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        '0',
                        style: TextStyle(
                          color: AppColor.primary,
                          fontSize: 16.sp,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      IconButton(
                        onPressed: () {},
                        icon: Center(
                          child: Icon(Icons.remove, color: AppColor.primary),
                        ),
                        style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                            AppColor.containerBackground,
                          ),
                          alignment: AlignmentDirectional.center,
                        ),
                      ),
                      SizedBox(width: 170.w),
                      Text(
                        '\$ ${product['price']}',
                        style: TextStyle(
                          color: AppColor.primary,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5.h),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                        AppColor.tabBarColor,
                      ),
                      shape: WidgetStatePropertyAll(
                        ContinuousRectangleBorder(
                          borderRadius: BorderRadius.circular(18.r),
                        ),
                      ),
                      padding: WidgetStatePropertyAll(
                        EdgeInsets.symmetric(vertical: 15, horizontal: 120),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      "Add to Order",
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: AppColor.primary,
                      ),
                    ),
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
