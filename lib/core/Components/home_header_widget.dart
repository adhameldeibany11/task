import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:untitled/main.dart';


class HomeHeaderWidget extends StatelessWidget {
  final String name;

  const HomeHeaderWidget({
    super.key,
    this.name = "مريم احمد",
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 13.w, right: 13.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              InkWell(
                onTap: () {},
                child: Container(
                  width: 43.sp,
                  height: 43.sp,
                  decoration: BoxDecoration(
                    color: appColors.background,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/images/qr.svg',
                      width: 27.sp,
                      height: 27.sp,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 9.w),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 150.w,
                    child: AutoSizeText(
                      'مرحبا بك $name',
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: appColors.primarytextcolor,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'din',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 150.w,
                    child: AutoSizeText(
                      'كيف حالك اليوم',
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: appColors.secondtextcolor,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'din',
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),

          Row(
            children: [
              InkWell(
                onTap: () {},
                child: Container(
                  width: 43.sp,
                  height: 43.sp,
                  decoration: BoxDecoration(
                    color: appColors.background,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/images/bell.svg',
                      width: 24.sp,
                      height: 24.sp,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 16.w),
              InkWell(
                onTap: () {},
                child: Container(
                  width: 43.sp,
                  height: 43.sp,
                  decoration: BoxDecoration(
                    color: appColors.background,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/images/cart.svg',
                      width: 24.sp,
                      height: 24.sp,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
