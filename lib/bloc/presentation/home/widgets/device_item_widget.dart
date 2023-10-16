import 'package:ta_iot/bloc/presentation/home/widgets/device_item_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/model/device_model.dart';
import '../../../domain/home/home_bloc.dart';
import '../../common/styles/device_item_style.dart';
import 'device_energy_widget.dart';
import 'device_item_text_widget.dart';

class DeviceItemWidget extends StatefulWidget {
  final DeviceInfoModel _deviceInfoModel;
  final double _deviceItemHeight;
  final HomeBloc _homeBloc;

  DeviceItemWidget({Key? key, required DeviceInfoModel deviceInfoModel, required double deviceItemHeight, required HomeBloc homeBloc}) : _homeBloc = homeBloc, _deviceItemHeight = deviceItemHeight, _deviceInfoModel = deviceInfoModel, super(key: key);

  @override
  State<StatefulWidget> createState() {
    return DeviceItemWidgetState(deviceInfoModel: _deviceInfoModel, deviceItemHeight: _deviceItemHeight);
  }
}

class DeviceItemWidgetState extends State<DeviceItemWidget> {
  late DeviceInfoModel deviceInfoModel;
  final double deviceItemHeight;
  bool isSwitchedOn = false;
  late final HomeBloc homeBloc;

  DeviceItemWidgetState({
    Key? key,
    required this.deviceInfoModel,
    required this.deviceItemHeight,
  });

  @override
  void initState() {
    super.initState();
    isSwitchedOn = deviceInfoModel.deviceState == 1 ? true : false;
    homeBloc = BlocProvider.of<HomeBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: homeBloc,
        builder: (context, state) {
          if (state is DeviceListLoaded) {
            return _getDeviceItemWidget();
          } else if (state is DeviceStateChanged) {
            deviceInfoModel = state.deviceInfoModel;
            return _getDeviceItemWidget();
          } else {
            return Container();
          }
        },
        buildWhen: (context, state) {
          if (state is DeviceListLoaded) return true;
          if (state is DeviceStateChanged && deviceInfoModel.deviceId == state.deviceInfoModel.deviceId) {
            return true;
          }
          return false;
        });
  }

  Widget _getDeviceItemWidget() {
    return Container(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            DeviceItemIconWidget(path: deviceInfoModel.deviceImagePath),
            Switch(
              value: isSwitchedOn,
              onChanged: (value) {
                widget._homeBloc.add(DeviceStateEvent(deviceInfoModel.deviceId, value ? 1 : 0));
                isSwitchedOn = value;
              },
            )
          ]),
          const SizedBox(
            height: 10,
          ),
          DeviceItemWidgetText(deviceInfoModel: deviceInfoModel),
          const SizedBox(
            height: 20,
          ),
          DeviceEnergyWidget(deviceInfoModel: deviceInfoModel)
        ]),
        // height: 100,
        margin: const EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
        padding: const EdgeInsets.all(3.0),
        decoration: CommonStyle.getDeviceItemDecorator());
  }
}
