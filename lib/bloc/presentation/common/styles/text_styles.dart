import 'package:flutter/material.dart';

abstract class HomeStyles {
  static const TextStyle headerStyle = TextStyle(fontSize: 18, color: Colors.black87, fontWeight: FontWeight.bold);
}

abstract class ACDeviceStyles {
  static const TextStyle temperationChangeStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 18);
}

abstract class DeviceParamTextStyles {
  static const TextStyle valueStyle = TextStyle(color: Colors.black87, fontSize: 16);
  static const TextStyle paramStyle = TextStyle(color: Colors.black54);
}

abstract class DeviceCategoryTextStyles {
  static TextStyle headerStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87.withOpacity(.7));
  static const TextStyle categoryNameStyle = TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black54);
}

abstract class DashboardTextStyles {
  static TextStyle paramStyle = TextStyle(fontSize: 12, color: Colors.black87.withOpacity(.5));
  static const TextStyle energyStyle = TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
  static const TextStyle energyValueStyle = TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.blue);
}
