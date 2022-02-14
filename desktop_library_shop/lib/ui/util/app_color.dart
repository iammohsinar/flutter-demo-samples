//
// @ Author: Mohsin AR
// @ Email: mohsinazeemrind@gmail.com
// @ Github: https://github.com/iammohsinar
// @ Create Time: 14-11-2021 23:29:57
// @ Modified time: 10-02-2022 00:44:10
//

//(index == 0) ? const Color(0xff8E8D88) : Color(0xffDDDCD4)

import 'package:flutter/material.dart';
import 'dart:math' as math;

const Color activeColor = Color(0xff8E8D88);
const Color inActiveColor = Color(0xffDDDCD4);
const Color fieldActiveColor = Color(0xFFFFFFD6);
const Color fieldFocusColor = Color(0xffC9C7BB);
const Color borderColor = Color(0xff999999);
const Color errorBorderColor = Color(0xFFB70B0B);
const Color dividerColor = Color(0xAA212121);
const Color activeLabelColor = Colors.black;
const Color inActiveLabelColor = Colors.white;
const Color errorTextColor = Color(0xFFB70B0B);
const Color backgroundColor = Color(0xFFD8D7CE);
const Color panelBackgroundColor = Color(0xFFF6F3EA);
const Color innerPanelBackgroundColor = Color(0xFFFFFFFF);

Color adjustBrightness() {
  HSVColor hsv = HSVColor.fromColor(inActiveColor);
  HSVColor adjusted = HSVColor.fromAHSV(
    hsv.alpha,
    hsv.hue,
    hsv.saturation,
    math.min(math.max(hsv.value + 0.1, 0), 1),
  );
  return adjusted.toColor();
}
