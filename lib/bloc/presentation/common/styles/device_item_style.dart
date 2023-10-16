import 'package:flutter/material.dart';

abstract class CommonStyle {
  static Decoration getDeviceItemDecorator() {
    return BoxDecoration(border: Border.all(color: Colors.black26), borderRadius: BorderRadius.all(Radius.circular(10)));
  }

  static Decoration getDeviceParamsDecorator() {
    return BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.2),
            blurRadius: 10.0,
          )
        ],
        borderRadius: BorderRadius.all(Radius.circular(10)));
  }

  static Decoration getACModeItemDecorator({Color color = Colors.white}) {
    return BoxDecoration(
        color: color,
        border: Border.all(color: Colors.black12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.2),
            blurRadius: 20.0,
          )
        ],
        borderRadius: BorderRadius.all(Radius.circular(10)));
  }

  static Decoration getCategoryDecorator({Color color = Colors.blue}) {
    return BoxDecoration(
        color: color, border: Border.all(color: Colors.black12.withOpacity(.1)), borderRadius: BorderRadius.all(Radius.circular(20)));
  }
}
