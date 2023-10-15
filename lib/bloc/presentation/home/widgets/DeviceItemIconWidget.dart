
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../data/model/device_model.dart';

class DeviceItemIconWidget extends StatelessWidget {
  final String _path;

  const DeviceItemIconWidget({
    Key? key,
    required String path,
  }) : _path = path, super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: Container(
          margin: const EdgeInsets.all(10.0),
          child: Image.asset(
            _path,
            height: 20,
            width: 20,
            fit: BoxFit.cover,
          )),
      height: 40,
      width: 40,
      decoration: BoxDecoration(color: Colors.blueAccent.withOpacity(.2), shape: BoxShape.circle),
    );
  }
}
