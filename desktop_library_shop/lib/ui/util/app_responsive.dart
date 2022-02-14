//
// @ Author: Mohsin AR
// @ Email: mohsinazeemrind@gmail.com
// @ Github: https://github.com/iammohsinar
// @ Create Time: 01-12-2021 23:12:43
// @ Modified time: 10-02-2022 00:44:01
//

import 'package:flutter/material.dart';

class ScreenSize {
  final BuildContext context;
  final int _smallScreenW = 1500;
  final int _smallScreenH = 900;
  bool get smallSize => _small();

  ScreenSize(this.context);

  bool _small() {
    return (MediaQuery.of(context).size.width < _smallScreenW &&
        MediaQuery.of(context).size.height < _smallScreenH);
  }
}
