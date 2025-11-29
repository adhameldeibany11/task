import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/main.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback? ViewAll;

  const SectionHeader({
    super.key,
    required this.title,
    this.ViewAll,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 13.w, right: 13.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
            style: TextStyle(
              fontSize: 16.sp,
              color: appColors.primarytextcolor,
              fontFamily: 'din',
              fontWeight: FontWeight.w500,
            ),
          ),
          InkWell(
            onTap: ViewAll ?? () {},
            child: Container(
              width: 67.w,
              height: 17.h,
              decoration: BoxDecoration(
                color: appColors.background,
                borderRadius: BorderRadius.circular(4.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 15,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Center(
                child: ShaderMask(
                  shaderCallback: (bounds) {
                    return LinearGradient(
                      colors: [
                        appColors.primary,
                        appColors.second,
                        appColors.third,
                      ],
                    ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height));
                  },
                  child: Text(
                    'عرض الكل',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'din',
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
