import 'package:TA_IOT/bloc/data/model/device_model.dart';
import 'package:TA_IOT/bloc/presentation/common/styles/DeviceItemStyle.dart';
import 'package:TA_IOT/bloc/presentation/home/widgets/DeviceItemIconWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class DeviceDetailScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DeviceDetailState();
  }
}

class DeviceDetailState extends State<DeviceDetailScreen> {
  final String header = "Device Detail";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Padding(
                padding: EdgeInsets.all(20),
                child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                  Text(header, style: TextStyle(fontSize: 18, color: Colors.black87, fontWeight: FontWeight.bold)),
                  Container(
                    child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                      Center(
                          child: Container(
                              margin: const EdgeInsets.all(5.0),
                              child: Image.asset(
                                "assets/images/ac_icon.png",
                                height: 150,
                                fit: BoxFit.cover,
                              ))),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ACModeWidget(
                            mode: "Cool",
                          ),
                          ACModeWidget(
                            mode: "Dry",
                          ),
                          ACModeWidget(
                            mode: "Sleep",
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      ACTemperatureWidget(),
                      const SizedBox(height: 50,),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DeviceParamWidget(),
                          DeviceParamWidget(),
                        ],
                      )
                    ]),
                  )
                ]))));
  }
}

class DeviceParamWidget extends StatelessWidget {
  const DeviceParamWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: CommonStyle.getDeviceParamsDecorator(),
      width: 120,
      height: 120,
      child: Padding(
          padding: EdgeInsets.all(0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DeviceItemIconWidget(
                path: "assets/images/energy.png",
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "50 %",
                        style: TextStyle(color: Colors.black87, fontSize: 18),
                      ),
                      Text("Humidity")
                    ],
                  ))
            ],
          )),
    );
  }
}

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

class ACModeWidget extends StatelessWidget {
  String mode = "Cool";

  ACModeWidget({Key? key, required this.mode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: 80,
      height: 80,
      decoration: CommonStyle.getACModeItemDecorator(),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/ac_icon.png",
            height: 30,
            fit: BoxFit.cover,
          ),
          Text(mode)
        ],
      )),
    );
  }
}
