import 'package:desktop_library_shop/ui/util/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//class

class AppTextFormField extends StatelessWidget {
  final FocusNode current;
  final FocusNode next;
  final double? width;
  final double? height;
  final int? maxLength;
  final TextEditingController? controller;
  final IconData? icon;
  final String validationMsg;
  final bool obscureText;

  bool isEnable;

  AppTextFormField(
      {Key? key,
      this.maxLength,
      this.width,
      this.height,
      required this.current,
      required this.next,
      this.controller,
      required this.validationMsg,
      this.icon,
      this.obscureText = false,
      this.isEnable = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextFormField(
        //style: const TextStyle(height: 1.2, fontWeight: FontWeight.bold),
        //maxLines: 1,
        minLines: 1,
        maxLength: maxLength,
        obscureText: obscureText,
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
            isDense: true,
            counterText: ' ',
            prefixIcon: Icon(icon),
            enabled: isEnable,
            contentPadding: const EdgeInsets.only(
              top: 5,
            ), //const EdgeInsets.all(10.0),,
            fillColor: (isEnable) ? fieldActiveColor : fieldFocusColor,
            filled: true,
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: borderColor, width: 0.8)),
            focusedErrorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: errorBorderColor, width: 0.8)),
            errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: errorBorderColor, width: 0.8)),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: borderColor, width: 0.8))),
      ),
    );
  }
}
