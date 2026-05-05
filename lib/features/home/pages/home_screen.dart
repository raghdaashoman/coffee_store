import 'package:cached_network_image/cached_network_image.dart';
import 'package:drinkable/core/constent/app_image.dart';
import 'package:drinkable/core/constent/app_strings.dart';
import 'package:drinkable/features/home/data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constent/app_color.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 0,
      child: Scaffold(
        backgroundColor: AppColor.background,
        appBar: AppBar(
          bottom: TabBar(
            unselectedLabelColor: AppColor.primary,
            labelColor: AppColor.secondary,
            indicatorColor: AppColor.secondary,
            dividerColor: AppColor.secondary,
            tabs: [
              Tab(child: Text('coffee')),
              Tab(child: Text('Tea')),
              Tab(child: Text('juice')),
              Tab(child: Text('cake')),
            ],
          ),
          backgroundColor: AppColor.background,
          leading: Image.asset(AppImage.menuIcon, width: 24.w, height: 24.h),
          centerTitle: true,
          title: Text(
            AppStrings.drinkable,
            style: TextStyle(
              color: AppColor.primary,
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          actionsPadding: EdgeInsets.only(right: 5.w),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 8.w),
              child: Image.asset(
                AppImage.searchIcon,
                width: 24.w,
                height: 24.h,
              ),
            ),
          ],
        ),
        body: CustomScrollView(
          slivers: [
            SliverGrid(
              delegate: SliverChildBuilderDelegate(childCount: allData.length, (
                context,
                index,
              ) {
                return InkWell(
                  onTap: () {
                    Navigator.pushReplacementNamed(
                      context,
                      '/home details',
                      arguments: allData[index],
                    );
                  },
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
                            imageUrl: '${allData[index]['image']}',
                            placeholder: (context, url) =>
                                CircularProgressIndicator(
                                  color: AppColor.tabBarColor,
                                ),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                        ),
                        Text(
                          textAlign: TextAlign.center,
                          '${allData[index]['name']}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColor.primary,
                            fontSize: 17.sp,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        SizedBox(height: 25.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(""),
                            Text(
                              '${allData[index]['price']}\$',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.sp,
                                fontFamily: 'Poppins',
                                color: AppColor.primary,
                              ),
                            ),
                            SizedBox(width: 5,),
                            Icon(Icons.account_balance,color: AppColor.primary,)
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 0.6128,
                crossAxisSpacing: 10,
                mainAxisSpacing: 25,
                crossAxisCount: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
