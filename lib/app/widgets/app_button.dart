// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:kota_attack_mobile_app/configurations/configurations.dart';

class AppButton extends StatelessWidget {
  AppButton({super.key, 
    required this.text,
    required this.onPressed,
    this.trailingIcon,
    this.textColor,
    this.color,
    this.style,
    this.textStyle,
    this.width,
    this.height,
    this.hasFixedSize = true,
    this.isButtonLoading = false,
    this.circularLoadingIndicatorColor = Colors.white,
    this.isEnabled = true,
  });

  String text;
  Color? textColor;
  FontWeight? textWeight;
  Color? color;
  VoidCallback onPressed;
  Widget? trailingIcon;
  ButtonStyle? style;
  TextStyle? textStyle;
  double? width;
  double? height;
  bool hasFixedSize;
  bool isButtonLoading;
  Color circularLoadingIndicatorColor;
  bool isEnabled;

  @override
  Widget build(BuildContext context) {
    final colors = Configuration().colors;

    return ElevatedButton(
      onPressed: isEnabled ? onPressed : () {},
      style: style ??
          ElevatedButton.styleFrom(
            backgroundColor: color?.withOpacity(isEnabled ? 1 : 0.6) ??
                colors.primaryColor.withOpacity(isEnabled ? 1 : 0.6),
            elevation: 5,
            fixedSize: hasFixedSize ? Size(width ?? 80, height ?? 15) : null,
          ),
      child: !isButtonLoading
          ? Text(
              text,
              style: textStyle ??
                  TextStyle(
                    color: textColor ?? colors.primaryWhite,
                    fontWeight: textWeight ?? FontWeight.w300,
                  ),
            )
          : SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: circularLoadingIndicatorColor,
              ),
            ),
    );
  }
}
