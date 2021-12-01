import 'package:desktop_library_shop/ui/util/app_color.dart';
import 'package:desktop_library_shop/ui/util/app_responsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class AppElevatedBtn extends StatelessWidget {
  final FocusNode focusNode;

  final bool isEnable;
  final Function()? onPressedFn;
  String imgUrl;
  final String text;
  int colorValue;
  double? width;

  AppElevatedBtn(
      {required this.focusNode,
      required this.isEnable,
      required this.onPressedFn,
      this.imgUrl = '',
      required this.text,
      this.colorValue = 0,
      this.width,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: const Alignment(0, 0.2),
                end: Alignment.bottomCenter,
                colors: [inActiveColor, adjustBrightness()])),
        child: ElevatedButton(
            focusNode: focusNode,
            style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(2.0),
                enableFeedback: false,
                primary: (colorValue > 0) ? Color(colorValue) : Colors.transparent,
                side: const BorderSide(color: borderColor, width: 0.8),
                elevation: 0.0,
                shadowColor: Colors.transparent,
                onPrimary: Colors.black),
            onPressed: (!isEnable) ? null : onPressedFn,
            child: Container(
              padding: (ScreenSize(context).smallSize) ? EdgeInsets.all(2) : EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  (imgUrl != '')
                      ? Image.asset(
                          imgUrl,
                          // 'assets/save_icon.png',

                          width: (ScreenSize(context).smallSize) ? 20 : 26,
                          height: (ScreenSize(context).smallSize) ? 20 : 26,
                        )
                      : const SizedBox(),
                  SizedBox(
                    width: (ScreenSize(context).smallSize) ? 2.0 : 5.0,
                  ),
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: (ScreenSize(context).smallSize) ? 12 : 16,
                    ),
                  ),
                ],
              ),
            )));
  }

  Color _adjustBrightness(Color color, double adjustment) {
    HSVColor hsv = HSVColor.fromColor(color);
    HSVColor adjusted = HSVColor.fromAHSV(
      hsv.alpha,
      hsv.hue,
      hsv.saturation,
      math.min(math.max(hsv.value + adjustment, 0), 1),
    );
    return adjusted.toColor();
  }
}
