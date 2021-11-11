import 'package:flutter/material.dart';

class AppTextLabel extends StatelessWidget {
  final String text;
  const AppTextLabel(this.text, [Key? key]) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontWeight: FontWeight.bold),
    );
  }
}
