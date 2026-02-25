import 'package:flutter/material.dart';
import 'package:flutter_extension/util/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.color,
    this.textStyle,
    this.radius,
    this.margin = EdgeInsets.zero,
    required this.onTap,
    required this.text,
    this.loading = false,
    this.width,
    this.height,
  });

  final Function() onTap;
  final String text;
  final bool loading;
  final double? height;
  final double? width;
  final Color? color;
  final double? radius;
  final EdgeInsetsGeometry margin;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    final gradientColors = [const Color(0xFF151053), const Color(0xFF1069FF)];

    return Padding(
      padding: margin,
      child: GestureDetector(
        onTap: loading ? null : onTap,
        child: Container(
          width: width ?? Get.width,
          height: height ?? 53.h,
          decoration: BoxDecoration(
            gradient: color != null
                ? null
                : LinearGradient(
                    colors: gradientColors,
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
            color: color,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: loading
                ? SizedBox(
                    height: 20.h,
                    width: 20.h,
                    child: const CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 2,
                    ),
                  )
                : Text(
                    text,
                    style:
                        textStyle ??
                        AppStyles.h3(
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                  ),
          ),
        ),
      ),
    );
  }
}
