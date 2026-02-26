import 'package:flutter/material.dart';
import 'package:flutter_extension/util/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSearchWidget extends StatelessWidget {
  final String hintText;
  final String iconPath;
  final VoidCallback onIconClick;
  const CustomSearchWidget({
    super.key,
    required this.hintText,
    required this.iconPath,
    required this.onIconClick,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.h,
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(30.r),
        border: Border.all(width: 1.w, color: Colors.grey.shade700),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                style: TextStyle(color: Colors.white, fontSize: 16.sp),
                decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: 16.sp,
                  ),
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ),
            SizedBox(width: 12.w),
            GestureDetector(
              onTap: onIconClick,
              child: SvgPicture.asset(
                iconPath,
                width: 20.w,
                height: 20.h,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
