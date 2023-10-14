import 'package:flutter/material.dart';

class CommonStyle {
  static Decoration getDeviceItemDecorator() {
    return BoxDecoration(border: Border.all(color: Colors.black26), borderRadius: BorderRadius.all(Radius.circular(10)));
  }

  static Decoration getDeviceParamsDecorator() {
    return BoxDecoration(border: Border.all(color: Colors.black12), borderRadius: BorderRadius.all(Radius.circular(10)));
  }

  static Decoration getACModeItemDecorator({Color color = Colors.black12}) {
    return BoxDecoration(color: color, border: Border.all(color: Colors.black12), borderRadius: BorderRadius.all(Radius.circular(10)));
  }
}
