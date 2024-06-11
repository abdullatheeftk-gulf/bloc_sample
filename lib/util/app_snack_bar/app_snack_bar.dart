import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_snack_bar.freezed.dart';


@freezed
class AppSnackBar with _$AppSnackBar {

  factory AppSnackBar({
    required String errorMessage,
    @Default(null) Color? backGroundColor,
    @Default(Duration(seconds: 5)) Duration duration
  }) = _AppSnackBar;

  
}