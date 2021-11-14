import 'package:desktop_library_shop/ui/util/app_color.dart';
import 'package:flutter/material.dart';

class AppTextLabel extends StatelessWidget {
  final String text;
  const AppTextLabel(this.text, [Key? key]) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontWeight: FontWeight.bold, color: activeLabelColor),
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
