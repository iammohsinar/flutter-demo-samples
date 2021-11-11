import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {
  final FocusNode current;
  final FocusNode next;
  final double width;
  final double height;
  final TextEditingController controller;
  final IconData? icon;
  final String validationMsg;

  bool isEnable;

  AppTextFormField(
      {Key? key,
      required this.width,
      required this.height,
      required this.current,
      required this.next,
      required this.controller,
      required this.validationMsg,
      this.icon,
      this.isEnable = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextFormField(
        controller: controller,
        validator: (value) {
          if (value!.isEmpty) {
            return validationMsg;
          }
          return null;
        },
        onFieldSubmitted: (test) {
          current.unfocus();
          FocusScope.of(context).requestFocus(next);
        },
        focusNode: current,
        decoration: InputDecoration(
            prefixIcon: Icon(icon),
            enabled: isEnable,
            contentPadding: const EdgeInsets.all(10.0),
            fillColor: (isEnable) ? const Color(0xFFFFFFD6) : const Color(0xffC9C7BB),
            filled: true,
            focusedErrorBorder: const OutlineInputBorder(
                gapPadding: 5.0, borderSide: BorderSide(color: Color(0xFFe28568), width: 0.8)),
            errorBorder: const OutlineInputBorder(
                gapPadding: 5.0, borderSide: BorderSide(color: Color(0xFFe28568), width: 0.8)),
            enabledBorder: const OutlineInputBorder(
                gapPadding: 5.0,
                borderSide: BorderSide(color: Color(0xff999999), width: 0.8))),
      ),
    );
  }
}
