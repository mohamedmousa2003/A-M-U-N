import 'package:amun/features/home/presentation/pages/riviera/riviera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constant/text.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_style.dart';
import '../widgets/search_item.dart';
import 'classical/classical.dart';
import 'hotel/hotel_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.h ,vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h,),
              SearchItem(),
              SizedBox(height: 20.h,),
              Text(classical,style: AppTextStyle.size20.copyWith(fontWeight: FontWeight.bold),),
              Classical(),
              SizedBox(
                height: 260.h,
                child: Riviera(),
              ),
              SizedBox(height: 20.h,),
              Text(hotel,style: AppTextStyle.size20.copyWith(fontWeight: FontWeight.bold),),
              SizedBox(
                height: 260.h,
                child: HotelView(),
              ),
            ],
          ),
        ),
      ),
    );

  }

}




