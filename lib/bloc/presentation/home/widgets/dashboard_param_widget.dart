import 'package:ta_iot/bloc/presentation/common/styles/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashboardParamWidget extends StatelessWidget {
  final String _value;
  final String _paramName;
  final String _iconData;

  const DashboardParamWidget({
    required String value,
    required String paramName,
    required String iconData,
    super.key,
  }) : _iconData = iconData, _paramName = paramName, _value = value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          _iconData,
          height: 22,
          width: 22,
          fit: BoxFit.cover,
        ),
        const SizedBox(
          width: 8,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _value,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 1,
            ),
            Text(
              _paramName,
              style: DashboardTextStyles.paramStyle,
            )
          ],
        )
      ],
    );
  }
}