import 'package:flutter/material.dart';

class AppPanel extends StatelessWidget {
  final Color? headerColor;
  final Color? bodyColor;
  final String title;
  final Widget child;

  const AppPanel(
      {Key? key,
      required this.title,
      required this.child,
      this.headerColor = const Color(0xFF001D74),
      this.bodyColor = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.only(top: 5, bottom: 5, left: 5),
          color: headerColor, //Color(0xAA4C602A),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
        Expanded(child: Container(color: bodyColor, child: child))
      ],
    );
  }
}
