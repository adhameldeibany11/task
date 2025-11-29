import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled/main.dart';

class SmallBellCard extends StatelessWidget {
  const SmallBellCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
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
        child: Center(
          child: SvgPicture.asset(
            'assets/images/bell2.svg',
            width: 17.sp,
            height: 17.sp,
          ),
        ),
      ),
    );
  }
}
