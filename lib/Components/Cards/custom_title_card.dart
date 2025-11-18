import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/main.dart';

class CustomTitleCard extends StatelessWidget {
  final String title1;
  final String title2;
  final String time;
  final String date;

  const CustomTitleCard({
    Key? key,
    required this.title1,
    required this.title2,
    required this.time,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 184.w,
            height: 87.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.r),
              boxShadow: [
                BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3)),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.all(8.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    title1.isNotEmpty ? title1 : 'اسم الخدمة',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: appColors.primarytextcolor,
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                        fontFamily: 'din'),
                  ),
                  AutoSizeText(
                    title2.isNotEmpty ? title2 : 'وصف الخدمة',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: appColors.secondtextcolor,
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                        fontFamily: 'din'),
                  ),
                  SizedBox(height: 9.h),
                  Row(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                              width: 14.sp,
                              height: 14.sp,
                              child: Image.asset('assets/images/date.png')),
                          SizedBox(width: 2.w),
                          AutoSizeText(
                            date.isNotEmpty ? date : '10 اكتوبر',
                            maxLines: 1,
                            style: TextStyle(
                                color: appColors.primarytextcolor,
                                fontWeight: FontWeight.w400,
                                fontSize: 11.sp,
                                fontFamily: 'din'),
                          ),
                        ],
                      ),
                      SizedBox(width: 7.w),
                      Row(
                        children: [
                          SizedBox(
                              width: 14.sp,
                              height: 14.sp,
                              child: Image.asset('assets/images/time.png')),
                          SizedBox(width: 2.w),
                          AutoSizeText(
                            time.isNotEmpty ? time : 'PM 2:00',
                            maxLines: 1,
                            style: TextStyle(
                                color: appColors.primarytextcolor,
                                fontWeight: FontWeight.w400,
                                fontSize: 11.sp,
                                fontFamily: 'din'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: -2.sp,
            top: -2.sp,
            child: Container(
              width: 21.sp,
              height: 21.sp,
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
              child: Image.asset(
                'assets/images/bell2.png',
                width: 17.sp,
                height: 17.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
