import 'package:desktop_library_shop/ui/util/app_color.dart';
import 'package:desktop_library_shop/ui/util/app_responsive.dart';
import 'package:flutter/material.dart';
import 'package:window_size/window_size.dart';

class AppTextLabel extends StatelessWidget {
  final String text;
  const AppTextLabel(this.text, [Key? key]) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //ScreenSize(context).smallSize;
    return Text(
      text,
      style: TextStyle(
          fontSize: (ScreenSize(context).smallSize) ? 10 : 14,
          fontWeight: FontWeight.bold,
          color: activeLabelColor),
    );
  }
}

class AppErrorText extends StatelessWidget {
  final String text;
  const AppErrorText(this.text, [Key? key]) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontWeight: FontWeight.bold, color: errorTextColor),
    );
  }
}
