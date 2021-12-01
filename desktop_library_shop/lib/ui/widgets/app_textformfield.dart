import 'package:desktop_library_shop/ui/util/app_color.dart';
import 'package:desktop_library_shop/ui/util/app_responsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppDropDown extends StatelessWidget {
  final List<DropdownMenuItem<String>> items;
  final void Function(String?)? onChange;
  final String? Function(String?)? validator;
  final String? value;
  final FocusNode? currentFocus;

  const AppDropDown(
      {Key? key,
      required this.items,
      this.onChange,
      this.validator,
      this.value,
      this.currentFocus})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //width: 120,
      //height: 30,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: const Alignment(0, 0.2),
              end: Alignment.bottomCenter,
              colors: [fieldActiveColor, adjustBrightness()])),
      child: DropdownButtonFormField<String>(
          isExpanded: true,
          focusNode: currentFocus,
          decoration: InputDecoration(
              isDense: true,
              // counterText: ' ',
              //prefixIcon: (icon != null) ? Icon(icon) : null, //icon ?? Icon(icon),
              //enabled: isEnable,
              contentPadding: (ScreenSize(context).smallSize)
                  ? const EdgeInsets.only(top: 8, left: 6)
                  : const EdgeInsets.only(top: 15, left: 10),
              //const EdgeInsets.all(10.0),,
              // fillColor: activeColor, //(isEnable) ? fieldActiveColor : fieldFocusColor,
              filled: true,
              border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 0.8)),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: borderColor, width: 0.8)),
              focusedErrorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: errorBorderColor, width: 0.8)),
              errorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: errorBorderColor, width: 0.8)),
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: borderColor, width: 0.8))),
          style: TextStyle(
            //fontSize: 18.0,
            fontSize: (ScreenSize(context).smallSize) ? 10 : 14,
            color: activeLabelColor,
          ),
          // underline: Container(
          //   height: 2,
          //   color: Color(0xFF6e4875),
          // ),
          icon: Icon(Icons.unfold_more),
          iconEnabledColor: Color(0xFF426d8e),
          //iconSize: 24.0,
          //  elevation: 16,
          value: value,
          onChanged: onChange,
          validator: validator,
          // value: 'value',
          items: items),
    );
  }
}

class AppTextFormField extends StatelessWidget {
  final FocusNode current;
  final FocusNode? next;
  final double? width;
  final double? height;
  final int? maxLength;
  final int? maxLines;
  final String? hintText;
  final TextEditingController? controller;
  final IconData? icon;
  //final String validationMsg;
  final String? Function(String?)? validator;
  final bool obscureText;

  bool isEnable;

  AppTextFormField(
      {Key? key,
      this.maxLength,
      this.width,
      this.height,
      required this.current,
      this.next,
      this.controller,
      this.validator,
      // required this.validationMsg,
      this.icon,
      this.hintText,
      this.obscureText = false,
      this.isEnable = true,
      this.maxLines = 1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
        fontSize: (ScreenSize(context).smallSize) ? 10 : 18,
        fontWeight: FontWeight.bold,
      ),
      maxLines: maxLines,
      //minLines: 1,
      maxLength: maxLength,
      obscureText: obscureText,
      controller: controller,
      validator: validator,
      onFieldSubmitted: (test) {
        current.unfocus();
        FocusScope.of(context).requestFocus(next);
      },
      focusNode: current,
      decoration: InputDecoration(
          hintText: hintText,
          isDense: true,
          counterText: ' ',
          prefixIcon: (icon != null) ? Icon(icon) : null, //icon ?? Icon(icon),
          enabled: isEnable,
          contentPadding:
              const EdgeInsets.only(top: 15, left: 6), //const EdgeInsets.all(10.0),,
          fillColor: (isEnable) ? fieldActiveColor : fieldFocusColor,
          filled: true,
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 0.8)),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 2.5)),
          focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: errorBorderColor, width: 1.5)),
          errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: errorBorderColor, width: 1.5)),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: borderColor, width: 0.8))),
    );
  }
}
