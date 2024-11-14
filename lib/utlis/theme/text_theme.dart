import 'package:flutter/material.dart';
import 'package:google_keep_arfoon/utlis/constants/colors.dart';

class GoogleKeepTextTheme {
  GoogleKeepTextTheme({
    this.fontFamily = "GoogleSans",
  }) : _baseTextStyle = TextStyle(
            fontFamily: fontFamily,
            fontWeight: FontWeights.regular,
            height: 1.2,
            color: GoogleKeepColors.dark90);

  final String fontFamily;
  final TextStyle _baseTextStyle;

  TextStyle get heading1 => _baseTextStyle.copyWith(
        fontSize: 36.0,
        fontWeight: FontWeights.semiBold,
      );

  TextStyle get heading2 => _baseTextStyle.copyWith(
        fontSize: 32.0,
        fontWeight: FontWeights.semiBold,
      );

  TextStyle get heading3 => _baseTextStyle.copyWith(
        fontSize: 28.0,
        fontWeight: FontWeights.semiBold,
      );

  TextStyle get heading4 => _baseTextStyle.copyWith(
        fontSize: 24.0,
        fontWeight: FontWeights.semiBold,
      );

  TextStyle get heading5 => _baseTextStyle.copyWith(
      fontSize: 24.0,
      fontWeight: FontWeights.bold,
      color: GoogleKeepColors.dark90,
      height: 1.8);
  TextStyle get heading6 => _baseTextStyle.copyWith(
        fontSize: 20.0,
        fontWeight: FontWeights.regular,
        color: GoogleKeepColors.dark90,
      );

  TextStyle get heading6Bold => _baseTextStyle.copyWith(
        fontSize: 20.0,
        fontWeight: FontWeights.bold,
        color: GoogleKeepColors.dark90,
      );

  TextStyle get heading6SemiBold => _baseTextStyle.copyWith(
        fontSize: 20.0,
        fontWeight: FontWeight.w600,
        color: GoogleKeepColors.white,
        height: 1.2,
      );

  TextStyle get bodyLargeMedium => _baseTextStyle.copyWith(
        fontSize: 17.0,
        fontWeight: FontWeights.medium,
        height: 1.2,
      );

  TextStyle get bodyLargeSemiBold => _baseTextStyle.copyWith(
        fontSize: 17.0,
        fontWeight: FontWeight.w600,
        height: 1.2,
      );

  TextStyle get bodyLargeRegular =>
      _baseTextStyle.copyWith(fontSize: 17.0, height: 1.2);

  TextStyle get bodyRegular => _baseTextStyle.copyWith(
        fontSize: 15.0,
        fontWeight: FontWeights.regular,
      );

  TextStyle get bodyMedium => _baseTextStyle.copyWith(
      fontSize: 15.0, fontWeight: FontWeight.w500, height: 1.2);

  TextStyle get bodyMediumSemiBold => _baseTextStyle.copyWith(
        fontSize: 15.0,
        fontWeight: FontWeight.w600,
      );

  TextStyle get bodySmallRegular => _baseTextStyle.copyWith(
      fontSize: 13.0, fontWeight: FontWeights.regular, height: 1.5);

  TextStyle get bodySmallMedium => _baseTextStyle.copyWith(
      fontSize: 13.0, fontWeight: FontWeights.medium, height: 1.2);

  TextStyle get bodySmallSemiBold => _baseTextStyle.copyWith(
      fontSize: 13.0, fontWeight: FontWeight.w600, height: 1.5);

  TextStyle get headline => _baseTextStyle.copyWith(
        fontSize: 14.0,
        fontWeight: FontWeights.semiBold,
      );

  TextStyle get captionRegular => _baseTextStyle.copyWith(
        fontSize: 11.0,
        fontWeight: FontWeight.w400,
      );
  TextStyle get captionMedium => _baseTextStyle.copyWith(
        fontSize: 11.0,
        fontWeight: FontWeights.medium,
      );
  TextStyle get captionBold => _baseTextStyle.copyWith(
        fontSize: 11.0,
        fontWeight: FontWeights.bold,
      );
}

extension FontWeights on FontWeight {
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
}
