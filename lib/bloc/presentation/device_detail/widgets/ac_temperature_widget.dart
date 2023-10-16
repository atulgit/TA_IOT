import 'package:TA_IOT/bloc/data/model/device_model.dart';
import 'package:TA_IOT/bloc/presentation/common/styles/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../domain/device_detail/device_detail_bloc.dart';

class ACTemperatureWidget extends StatefulWidget {
  final DeviceInfoModel _deviceInfoModel;

  const ACTemperatureWidget({
    required DeviceInfoModel deviceInfoModel,
    Key? key,
  })  : _deviceInfoModel = deviceInfoModel,
        super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ACTemperatureWidgetState();
  }
}

class ACTemperatureWidgetState extends State<ACTemperatureWidget> {
  late final DeviceDetailBloc _deviceDetailBloc;

  ACTemperatureWidgetState({
    Key? key,
  });

  @override
  void initState() {
    super.initState();

    _deviceDetailBloc = BlocProvider.of<DeviceDetailBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      SizedBox(
          width: 40,
          child: ElevatedButton(
              onPressed: () {
                _deviceDetailBloc.add(ACTemperatureChangeEvent("-", widget._deviceInfoModel.deviceId));
              },
              child: Text(
                "-",
                style: ACDeviceStyles.temperationChangeStyle,
              ))),
      BlocBuilder(
          bloc: _deviceDetailBloc,
          builder: (BuildContext context, DeviceDetailState state) {
            if (state is ACTemperatureChangeState) {
              return _getTemperatureWidget(state.deviceDetail);
            }
            if (state is DeviceDetailLoadedState) {
              return _getTemperatureWidget(state.deviceDetail);
            } else {
              return Container();
            }
          },
          buildWhen: (previousState, state) {
            if (state is ACTemperatureChangeState || state is DeviceDetailLoadedState) return true;
            return false;
          }),
      SizedBox(
          width: 40,
          child: ElevatedButton(
              onPressed: () {
                _deviceDetailBloc.add(ACTemperatureChangeEvent("+", widget._deviceInfoModel.deviceId));
              },
              child: Text(
                "+",
                style: ACDeviceStyles.temperationChangeStyle,
              ))),
    ]);
  }

  Widget _getTemperatureWidget(DeviceInfoModel deviceInfoModel) {
    return Container(
        margin: EdgeInsets.only(left: 15, right: 15),
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
          percent: deviceInfoModel.airConditioner!.temperature.toDouble() / 100,
          animation: true,
          animationDuration: 1200,
          center: new Text("${deviceInfoModel.airConditioner?.temperature}° C"),
          progressColor: Colors.blueAccent,
        ));
  }
}
