import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/core/Components/section_header.dart';
import 'package:untitled/features/banner/presentation/widgets/banner_widget.dart';
import 'package:untitled/main.dart';
import '../../../core/databases/api/api_service.dart';
import '../../../core/Components/home_header_widget.dart';
import '../../../core/Components/products_widget.dart';
import '../../../core/Components/services_widget.dart';
import '../../../features/products/presentation/widgets/CustomCardHome.dart';
import '../../../features/services/presentation/widgets/custom_title_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final ApiService apiService = ApiService();

  List<dynamic> banners = [];
  List<dynamic> products = [];
  List<dynamic> services = [];

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
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    );
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
                  HomeHeaderWidget(),
                  SizedBox(height: 30.h,),
                  BannerWidget(banners: banners),
                  SizedBox(height: 30.h,),
                  SectionHeader(title: 'الجلسه القادمه', ViewAll: (){},),
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
                                child: CustomTitleCard(data: service),
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
                        ServicesWidget(),
                        SizedBox(width: 16.w,),
                        ProductsWidget(),
                      ],
                    ),
                  ),
                  SizedBox(height: 22.h,),
                  SectionHeader(title: 'تذكيراتي', ViewAll: (){},),
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
                                child: CustomTitleCard(data: service),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8.h,),
                  SectionHeader(title: 'خدمات جديدا', ViewAll: (){},),
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
                                  data: product,
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
                  SectionHeader(title: 'افضل المنتجات', ViewAll: (){},),
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
                                  data: product,
                                  cardColor: appColors.card1,
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
