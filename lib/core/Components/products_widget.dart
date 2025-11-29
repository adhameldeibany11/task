import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/main.dart';

class ProductsWidget extends StatelessWidget {
  const ProductsWidget({super.key,});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Container(
        width: 165.w,
        height: 74.h,
        decoration: BoxDecoration(
          color: appColors.card2,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 7.w, right: 7.w, top: 10.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  AutoSizeText('المنتجات',
                    style: TextStyle(
                      fontSize: 17.sp,
                      color: appColors.primarytextcolor,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'din',
                    ),
                  ),
                ],
              ),
              Image.asset('assets/images/image3.png'),
            ],
          ),
        ),
      ),
    );
  }
}
