import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/main.dart';

import '../../../../core/Components/small_bell_card.dart';

class CustomTitleCard extends StatelessWidget {
  final Map<String, dynamic> data;
  final Color? cardColor;

  const CustomTitleCard({
    Key? key,
    required this.data,
    this.cardColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title1 = (data['title'] ?? data['name'] ?? '') as String;
    final title2 = (data['description'] ?? data['subtitle'] ?? '') as String;
    final date = (data['date'] ?? '') as String;
    final time = (data['time'] ?? '') as String;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 184.w,
            height: 87.h,
            decoration: BoxDecoration(
              color: cardColor ?? Colors.white,
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
                      fontFamily: 'din',
                    ),
                  ),
                  AutoSizeText(
                    title2.isNotEmpty ? title2 : 'وصف الخدمة',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: appColors.secondtextcolor,
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                      fontFamily: 'din',
                    ),
                  ),
                  SizedBox(height: 9.h),
                  Row(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 14.sp,
                            height: 14.sp,
                            child: Image.asset('assets/images/date.png'),
                          ),
                          SizedBox(width: 2.w),
                          AutoSizeText(
                            date.isNotEmpty ? date : '10 اكتوبر',
                            maxLines: 1,
                            style: TextStyle(
                              color: appColors.primarytextcolor,
                              fontWeight: FontWeight.w400,
                              fontSize: 11.sp,
                              fontFamily: 'din',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 7.w),
                      Row(
                        children: [
                          SizedBox(
                            width: 14.sp,
                            height: 14.sp,
                            child: Image.asset('assets/images/time.png'),
                          ),
                          SizedBox(width: 2.w),
                          AutoSizeText(
                            time.isNotEmpty ? time : 'PM 2:00',
                            maxLines: 1,
                            style: TextStyle(
                              color: appColors.primarytextcolor,
                              fontWeight: FontWeight.w400,
                              fontSize: 11.sp,
                              fontFamily: 'din',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SmallBellCard(),
        ],
      ),
    );
  }
}

