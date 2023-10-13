import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ACTemperatureWidget extends StatelessWidget {
  const ACTemperatureWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            shape: BoxShape.circle, // BoxShape.circle or BoxShape.retangle
            //color: const Color(0xFF66BB6A),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(.3),
                blurRadius: 5.0,
              )
            ]),
        child: CircularPercentIndicator(
          radius: 65.0,
          lineWidth: 15.0,
          percent: 0.30,
          animation: true,
          animationDuration: 1200,
          center: new Text("30° C"),
          progressColor: Colors.blueAccent,
        ));
  }
}
