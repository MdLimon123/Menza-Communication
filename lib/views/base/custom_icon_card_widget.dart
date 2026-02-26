import 'package:flutter/material.dart';
import 'package:flutter_extension/util/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomIconCardWidget extends StatelessWidget {
  final String svgPath;
  const CustomIconCardWidget({super.key, required this.svgPath});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(50.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(10.w),
        child: SvgPicture.asset(
          svgPath,
          width: 28.w,
          height: 28.h,
          color: Colors.white,
        ),
      ),
    );
  }
}
