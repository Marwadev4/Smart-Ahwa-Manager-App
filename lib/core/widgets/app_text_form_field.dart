import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_ahwa_manager_app/core/theming/colors.dart';
import 'package:smart_ahwa_manager_app/core/theming/styles.dart';

class AppTextFormField extends StatelessWidget {
  final String? hintText;
  final String labelText;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;
  final bool? enabled;
  final int? maxLines;
  final TextDirection? textDirection;
  final IconData? prefixIcon;
  final String? suffixText;

  const AppTextFormField({
    super.key,
    this.hintText,
    required this.labelText,
    this.isObscureText,
    this.suffixIcon,
    this.controller,
    this.validator,
    this.keyboardType,
    this.onChanged,
    this.enabled,
    this.maxLines,
    this.textDirection,
    this.prefixIcon,
    this.suffixText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: ColorsManager.normal,
      textDirection: textDirection,
      controller: controller,
      enabled: enabled ?? true,
      keyboardType: keyboardType,
      onChanged: onChanged,
      maxLines: maxLines ?? 1,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        focusedBorder: TextFormFieldBorders.focusedBorderForAppField,
        enabledBorder: TextFormFieldBorders.enabledBorderForAppField,
        errorBorder: TextFormFieldBorders.errorBorderForAppField,
        labelText: labelText,
        labelStyle: TextStyles.font22VeryDarkGray,
        fillColor: Colors.white,
        filled: true,
        prefixIcon: prefixIcon != null
            ? Icon(prefixIcon, color: ColorsManager.normal)
            : null,
      ),
      obscureText: isObscureText ?? false,
      style: TextStyles.font22Black,
      validator: validator,
    );
  }
}
