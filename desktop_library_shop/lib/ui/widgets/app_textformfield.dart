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
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: const Alignment(0, 0.2),
              end: Alignment.bottomCenter,
              colors: [fieldActiveColor, adjustBrightness()])),
      child: DropdownButtonFormField<String>(
          isExpanded: true,
          focusNode: currentFocus,
          decoration: InputDecoration(
              errorStyle: TextStyle(
                fontSize: (ScreenSize(context).smallSize) ? 8 : 10,
              ),
              isDense: true,
              contentPadding: (ScreenSize(context).smallSize)
                  ? const EdgeInsets.only(top: 8, left: 6)
                  : const EdgeInsets.only(top: 15, left: 10),
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
            fontSize: (ScreenSize(context).smallSize) ? 10 : 14,
            color: activeLabelColor,
          ),
          icon: Icon(Icons.unfold_more),
          iconEnabledColor: Color(0xFF426d8e),
          value: value,
          onChanged: onChange,
          validator: validator,
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
  final String? initialValue;
  final String? Function(String?)? validator;
  final Function(String)? onFieldSubmit;
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
      this.initialValue,
      this.icon,
      this.hintText,
      this.onFieldSubmit,
      this.obscureText = false,
      this.isEnable = true,
      this.maxLines = 1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      style: TextStyle(
        fontSize: (ScreenSize(context).smallSize) ? 12 : 18,
        fontWeight: FontWeight.bold,
      ),
      maxLines: maxLines,
      maxLength: maxLength,
      obscureText: obscureText,
      controller: controller,
      validator: validator,
      onFieldSubmitted: onFieldSubmit ??
          (test) {
            current.unfocus();
            FocusScope.of(context).requestFocus(next);
          },
      focusNode: current,
      decoration: InputDecoration(
          errorStyle: TextStyle(
            fontSize: (ScreenSize(context).smallSize) ? 8 : 10,
          ),
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
