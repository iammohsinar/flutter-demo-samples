import 'package:desktop_library_shop/ui/util/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppDropDown extends StatelessWidget {
  const AppDropDown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: const Alignment(0, 0.2),
              end: Alignment.bottomCenter,
              colors: [inActiveColor, adjustBrightness()])),
      child: DropdownButtonFormField<String>(
          decoration: InputDecoration(
              isDense: true,
              // counterText: ' ',
              //prefixIcon: (icon != null) ? Icon(icon) : null, //icon ?? Icon(icon),
              //enabled: isEnable,
              contentPadding:
                  const EdgeInsets.only(top: 15, left: 10), //const EdgeInsets.all(10.0),,
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
          style: const TextStyle(
            //fontSize: 18.0,
            color: Color(0xFF6e4875),
          ),
          // underline: Container(
          //   height: 2,
          //   color: Color(0xFF6e4875),
          // ),
          icon: Icon(Icons.unfold_more),
          iconEnabledColor: Color(0xFF426d8e),
          iconSize: 24.0,
          elevation: 16,
          // onChanged: (val) {
          //   print(val);
          // },
          // // validator: this.validator,
          // value: 'value',
          items: <String>['Choose language', 'Java', 'Flutter', 'Python', 'Reactjs']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem(
              value: value,
              child: Text(value),
            );
          }).toList()),
    );
  }
}

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
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),

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
            prefixIcon: (icon != null) ? Icon(icon) : null, //icon ?? Icon(icon),
            enabled: isEnable,
            contentPadding:
                const EdgeInsets.only(top: 15, left: 10), //const EdgeInsets.all(10.0),,
            fillColor: (isEnable) ? fieldActiveColor : fieldFocusColor,
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
      ),
    );
  }
}
