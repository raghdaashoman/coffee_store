import 'package:cached_network_image/cached_network_image.dart';
import 'package:drinkable/core/constent/app_image.dart';
import 'package:drinkable/core/constent/app_strings.dart';
import 'package:drinkable/features/home/data/data.dart';
import 'package:drinkable/features/home/widget/main_card.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constent/app_color.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  List<String> names = ['coffee', 'Tea', 'juice', 'cake',];
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
            tabs: names.map((e) => Tab(child: Text(e))).toList(),
          ),
          backgroundColor: AppColor.background,
          leading: IconButton(
            onPressed: () {
              if (context.locale == Locale('ar')) {
                context.setLocale(Locale('en'));
              } else {
                context.setLocale(Locale('ar'));
              }
            },
            icon: Icon(Icons.change_circle),
          ),
          centerTitle: true,
          title: Text(
            'hello'.tr(),
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
                return MainCard(
                  onTap: () {
                    Navigator.pushReplacementNamed(
                      context,
                      '/home details',
                      arguments: allData[index],
                    );
                  },
                  imageUrl: allData[index]['image'],
                  title: allData[index]['name'],
                  price: allData[index]['price'],
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
