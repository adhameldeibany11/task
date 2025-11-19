import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/main.dart';

class CustomCardHome extends StatelessWidget {
  final String image;
  final String title1;
  final String title2;
  final String price;
  final Color? cardColor;

  const CustomCardHome({
    Key? key,
    required this.image,
    required this.title1,
    required this.title2,
    required this.price,
    this.cardColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        width: 181.w,
        height: 185.h,
        decoration: BoxDecoration(
          color: cardColor ?? appColors.card1,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, 4)),
          ],
        ),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12.r),
                    topRight: Radius.circular(12.r),
                  ),
                  child: image.isNotEmpty
                      ? Image.network(
                    image,
                    height: 103.h,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  )
                      : Container(
                    height: 103.h,
                    color: Colors.grey[300],
                    child: Icon(Icons.image, size: 40.sp),
                  ),
                ),
                if (price.isNotEmpty)
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                    decoration: BoxDecoration(
                      color: appColors.background,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(12.r),
                        bottomLeft: Radius.circular(12.r),
                      ),
                    ),
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
                      child: Text(price,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'din'),
                      ),
                    ),
                  ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(8.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 160.w,
                    child: AutoSizeText(title1,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                          color: appColors.primarytextcolor,
                          fontFamily: 'din'
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 150.w,
                    child: AutoSizeText(title2,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 10.sp,
                          color: appColors.secondtextcolor,
                          fontFamily: 'din'
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
