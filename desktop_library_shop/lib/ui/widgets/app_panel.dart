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
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(top: 5, bottom: 5, left: 5),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 2.0),
              color: headerColor), //Color(0xAA4C602A),
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
        Container(
          padding: EdgeInsets.only(top: 10, left: 5, right: 5, bottom: 5), //all(5.0),
          child: child,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 2.0),
              color: bodyColor), //Color(0xAA4C602A),
        )
      ],
    );
  }
}
