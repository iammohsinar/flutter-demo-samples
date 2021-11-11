import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {
  final FocusNode current;
  final FocusNode next;
  final double width;
  final double height;
  bool isEnable;

  AppTextFormField(
      {Key? key,
      required this.width,
      required this.height,
      required this.current,
      required this.next,
      this.isEnable = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextFormField(
        onFieldSubmitted: (test) {
          current.unfocus();
          FocusScope.of(context).requestFocus(next);
        },
        focusNode: current,
        decoration: InputDecoration(
            enabled: this.isEnable,
            contentPadding: EdgeInsets.all(10.0),
            fillColor: Color(0xffdddcd5),
            filled: true,
            border: OutlineInputBorder(
                gapPadding: 5.0,
                borderSide: BorderSide(color: Color(0xff999999), width: 0.8))),
      ),
    );
  }
}
