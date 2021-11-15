import 'package:flutter/material.dart';

class UIUtil {
  /// vertical spacing constants.
  static const double _vXSmallSpace = 3.0;
  static const double _vSmallSpace = 15.0;
  static const double _vMediumSpace = 30.0;
  static const double _vLargeSpace = 75.0;

// hotizontal spacing constants
  static const double _hXSmallSpace = 3.0;
  static const double _hSmallSpace = 15.0;
  static const double _hMediumSpace = 30.0;
  static const double _hLargeSpace = 75.0;

  static Widget vXSmallSpace() {
    return verticalSpace(_vXSmallSpace);
  }

  static Widget vSmallSpace() {
    return verticalSpace(_vSmallSpace);
  }

  static Widget vMediumSpace() {
    return verticalSpace(_vMediumSpace);
  }

  static Widget vLargeSpace() {
    return verticalSpace(_vLargeSpace);
  }

  static Widget verticalSpace(double height) {
    return SizedBox(
      height: height,
    );
  }

  static Widget hXSmallSpace() {
    return horizontalSpace(_hXSmallSpace);
  }

  static Widget hSmallSpace() {
    return horizontalSpace(_hSmallSpace);
  }

  static Widget hMediumSpace() {
    return horizontalSpace(_hMediumSpace);
  }

  static Widget hLargeSpace() {
    return horizontalSpace(_hLargeSpace);
  }

  static Widget horizontalSpace(double width) {
    return SizedBox(
      width: width,
    );
  }
}
