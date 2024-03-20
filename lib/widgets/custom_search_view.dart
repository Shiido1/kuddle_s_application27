import 'package:flutter/material.dart';
import 'package:kuddle_s_application27/core/app_export.dart';

class CustomSearchView extends StatelessWidget {
  CustomSearchView({
    Key? key,
    this.alignment,
    this.width,
    this.controller,
    this.focusNode,
    this.autofocus = true,
    this.textStyle,
    this.textInputType = TextInputType.text,
    this.maxLines,
    this.hintText,
    this.hintStyle,
    this.prefix,
    this.prefixConstraints,
    this.suffix,
    this.suffixConstraints,
    this.contentPadding,
    this.borderDecoration,
    this.fillColor,
    this.filled = true,
    this.validator,
    this.onChanged, 
    this.onTapped,
  }) : super(
          key: key,
        );

  final Alignment? alignment;

  final double? width;

  final TextEditingController? controller;

  final FocusNode? focusNode;

  final bool? autofocus;

  final TextStyle? textStyle;

  final TextInputType? textInputType;

  final int? maxLines;

  final String? hintText;

  final TextStyle? hintStyle;

  final Widget? prefix;

  final BoxConstraints? prefixConstraints;

  final Widget? suffix;

  final BoxConstraints? suffixConstraints;

  final EdgeInsets? contentPadding;

  final InputBorder? borderDecoration;

  final Color? fillColor;

  final bool? filled;

  final FormFieldValidator<String>? validator;

  final Function(String)? onChanged;
  final Function()? onTapped;
  String query = '';

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: searchViewWidget(context),
          )
        : searchViewWidget(context);
  }

  Widget searchViewWidget(context) => SizedBox(
        width: width ?? double.maxFinite,
        child: TextFormField(
          controller: controller,
          focusNode: focusNode ?? FocusNode(),
          autofocus: autofocus!,
          style: textStyle ?? CustomTextStyles.bodyMediumGray400,
          keyboardType: textInputType,
          maxLines: maxLines ?? 1,
          decoration: decoration(context),
          validator: validator,
          onChanged: (String value) {
            onChanged!.call(value);
          },
        ),
      );

  InputDecoration decoration(context) => InputDecoration(
        hintText: hintText ?? "",
        hintStyle: hintStyle ?? CustomTextStyles.bodyMediumGray400,
        prefixIcon: prefix ??
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 10.h,
                vertical: 11.v,
              ),
              child: CustomImageView(
                imagePath: ImageConstant.imgSearch,
                height: 22.adaptSize,
                width: 22.adaptSize,
              ),
            ),
        prefixIconConstraints: prefixConstraints ??
            BoxConstraints(
              maxHeight: 44.v,
            ),
        suffixIcon: GestureDetector(
          onTap: onTapped,
          child: suffix ??
              Container(
                margin: EdgeInsets.fromLTRB(30.h, 7.v, 11.h, 7.v),
                child: CustomImageView(
                  imagePath: ImageConstant.imgFilterlist,
                  height: 30.adaptSize,
                  width: 30.adaptSize,
                ),
              ),
        ),
        suffixIconConstraints: suffixConstraints ??
            BoxConstraints(
              maxHeight: 44.v,
            ),
        isDense: true,
        contentPadding: contentPadding ?? EdgeInsets.symmetric(vertical: 12.v),
        fillColor: fillColor ?? theme.colorScheme.onPrimaryContainer,
        filled: filled,
        border: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.h),
              borderSide: BorderSide(
                color: theme.colorScheme.primary.withOpacity(0.2),
                width: 1,
              ),
            ),
        enabledBorder: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.h),
              borderSide: BorderSide(
                color: theme.colorScheme.primary.withOpacity(0.2),
                width: 1,
              ),
            ),
        focusedBorder: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.h),
              borderSide: BorderSide(
                color: theme.colorScheme.primary.withOpacity(0.2),
                width: 1,
              ),
            ),
      );

  }
