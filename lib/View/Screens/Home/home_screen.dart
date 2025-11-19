import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled/Components/Cards/custom_title_card.dart';
import 'package:untitled/Components/Cards/CustomCardHome.dart';
import 'package:untitled/main.dart';
import '../../../Network/api_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final ApiService apiService = ApiService();

  List banners = [];
  List products = [];
  List services = [];

  @override
  void initState() {
    super.initState();
    fetchBanners();
    fetchProducts();
    fetchServices();
  }

  void fetchBanners() async {
    final result = await apiService.getBanners();
    setState(() {
      banners = result;
    });
  }

  void fetchProducts() async {
    final result = await apiService.getProducts();
    setState(() {
      products = result;
    });
  }

  void fetchServices() async {
    final result = await apiService.getServices();
    setState(() {
      services = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: appColors.background,
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: Column(
                children: [
                  SizedBox(height: 17.h,),
                  Padding(
                    padding: EdgeInsets.only(left: 13.w, right: 13.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            InkWell(
                              onTap: (){},
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
                                  child: Image.asset('assets/images/qr.png',
                                    width: 27.sp,
                                    height: 27.sp,
                                  ),
                              ),
                            ),
                            SizedBox(width: 9.w,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 150.w,
                                  child: AutoSizeText('مرحبا بك مريم احمد',
                                    maxLines: 2,
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      color: appColors.primarytextcolor,
                                      fontWeight: FontWeight.w400,
                                        fontFamily: 'din'
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 150.w,
                                  child: AutoSizeText('كيف حالك اليوم',
                                    maxLines: 1,
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: appColors.secondtextcolor,
                                      fontWeight: FontWeight.w400,
                                        fontFamily: 'din'
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
                              onTap: (){},
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
                                child: Image.asset('assets/images/bell.png',
                                  width: 24.sp,
                                  height: 24.sp,
                                )
                              ),
                            ),
                            SizedBox(width: 16.w,),
                            InkWell(
                              onTap: (){},
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
                                  child: Image.asset('assets/images/cart.png',
                                    width: 24.sp,
                                    height: 24.sp,
                                  )
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 30.h,),
                  Padding(
                    padding: EdgeInsets.only(right: 8.w),
                    child: Container(
                      height: 122.h,
                      width: double.infinity,
                      child: banners.isEmpty
                          ? Center(child: CircularProgressIndicator())
                          : ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: banners.length,
                        itemBuilder: (context, index) {
                          final banner = banners[index];
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5.w),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.r),
                              child: Image.network(
                                banner['image'],
                                width: 300.w,
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 30.h,),
                  Padding(
                    padding: EdgeInsets.only(left: 13.w, right: 13.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('الجلسه القادمه',
                          style: TextStyle(
                              fontSize: 16.sp
                          ),
                        ),
                        InkWell(
                          onTap: (){},
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
                                child: Text('عرض الكل',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'din'
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 9.h,),
                  Padding(
                    padding: EdgeInsets.only(right: 8.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          constraints: BoxConstraints(maxHeight: 120.h),
                          child: services.isEmpty
                              ? Center(child: CircularProgressIndicator())
                              : ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: services.length,
                            itemBuilder: (context, index) {
                              final service = services[index];
                              return Padding(
                                padding: EdgeInsets.only(right: 10.w),
                                child: CustomTitleCard(
                                  title1: service['title'] ?? '',
                                  title2: service['description'] ?? '',
                                  time: service['time'] ?? '',
                                  date: service['date'] ?? '',
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8.h,),
                  Padding(
                    padding: EdgeInsets.only(left: 8.w, right: 8.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: (){},
                          child: Container(
                            width: 155.w,
                            height: 74.h,
                            decoration: BoxDecoration(
                              color: appColors.card1,
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left: 7.w, right: 7.w, top: 10.h),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      AutoSizeText('الخدمات',
                                        style: TextStyle(
                                            fontSize: 17.sp,
                                            color: appColors.primarytextcolor,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'din'
                                        ),
                                      ),
                                    ],
                                  ),
                                  Image.asset('assets/images/image2.png'),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 16.w,),
                        InkWell(
                          onTap: (){},
                          child: Container(
                            width: 155.w,
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
                                            fontFamily: 'din'
                                        ),
                                      ),
                                    ],
                                  ),
                                  Image.asset('assets/images/image3.png'),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 22.h,),
                  Padding(
                    padding: EdgeInsets.only(left: 12.w, right: 12.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('تذكيراتي',
                          style: TextStyle(
                              fontSize: 16.sp
                          ),
                        ),
                        InkWell(
                          onTap: (){},
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
                                child: Text('عرض الكل',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'din'
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 9.h,),
                  Padding(
                    padding: EdgeInsets.only(right: 8.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          constraints: BoxConstraints(maxHeight: 120.h),
                          child: services.isEmpty
                              ? Center(child: CircularProgressIndicator())
                              : ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: services.length,
                            itemBuilder: (context, index) {
                              final service = services[index];
                              return Padding(
                                padding: EdgeInsets.only(right: 10.w),
                                child: CustomTitleCard(
                                  title1: service['title'] ?? '',
                                  title2: service['description'] ?? '',
                                  time: service['time'] ?? '',
                                  date: service['date'] ?? '',
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8.h,),
                  Padding(
                    padding: EdgeInsets.only(left: 12.w, right: 12.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('خدمات جديدا',
                          style: TextStyle(
                              fontSize: 16.sp
                          ),
                        ),
                        InkWell(
                          onTap: (){},
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
                                child: Text('عرض الكل',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'din'
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 25.h,),
                  Padding(
                    padding: EdgeInsets.only(right: 8.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 185.h,
                          child: products.isEmpty
                              ? Center(child: CircularProgressIndicator())
                              : ListView.builder(
                            clipBehavior: Clip.none,
                            scrollDirection: Axis.horizontal,
                            itemCount: products.length,
                            itemBuilder: (context, index) {
                              final product = products[index];
                              return Padding(
                                padding: EdgeInsets.only(right: 12.w),
                                child: CustomCardHome(
                                  image: product['image'] ?? '',
                                  title1: product['title'] ?? '',
                                  title2: product['description'] ?? '',
                                  price: product['price'] ?? '',
                                  cardColor: appColors.card1,
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.h,),
                  Padding(
                    padding: EdgeInsets.only(left: 12.w, right: 12.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('افضل المنتجات',
                          style: TextStyle(
                              fontSize: 16.sp
                          ),
                        ),
                        InkWell(
                          onTap: (){},
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
                                child: Text('عرض الكل',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'din'
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 25.h,),
                  Padding(
                    padding: EdgeInsets.only(right: 8.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          constraints: BoxConstraints(maxHeight: 185.h),
                          child: products.isEmpty
                              ? Center(child: CircularProgressIndicator())
                              : ListView.builder(
                            clipBehavior: Clip.none,
                            scrollDirection: Axis.horizontal,
                            itemCount: products.length,
                            itemBuilder: (context, index) {
                              final product = products[index];
                              return Padding(
                                padding: EdgeInsets.only(right: 12.w),
                                child: CustomCardHome(
                                  image: product['image'] ?? '',
                                  title1: product['title'] ?? '',
                                  title2: product['description'] ?? '',
                                  price: product['price'] ?? '',
                                  cardColor: appColors.card2,
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 50.h,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}
