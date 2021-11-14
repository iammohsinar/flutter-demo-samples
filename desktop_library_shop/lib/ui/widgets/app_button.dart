import 'package:desktop_library_shop/ui/util/app_color.dart';
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
                colors: [inActiveColor, _adjustBrightness(inActiveColor, 0.1)])),
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
            child: SizedBox(
              height: 35.0,
              width: width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  (imgUrl != '')
                      ? Image.asset(
                          imgUrl,
                          // 'assets/save_icon.png',
                          width: 26,
                          height: 26,
                        )
                      : const SizedBox(),
                  const SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    text,
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
