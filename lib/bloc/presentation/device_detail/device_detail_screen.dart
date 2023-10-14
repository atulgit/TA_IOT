import 'package:TA_IOT/bloc/data/model/device_category.dart';
import 'package:TA_IOT/bloc/data/model/device_model.dart';
import 'package:TA_IOT/bloc/domain/device_detail/device_detail_bloc.dart';
import 'package:TA_IOT/bloc/presentation/common/styles/DeviceItemStyle.dart';
import 'package:TA_IOT/bloc/presentation/device_detail/widgets/ACDetailWidget.dart';
import 'package:TA_IOT/bloc/presentation/device_detail/widgets/TVDetailWidget.dart';
import 'package:TA_IOT/bloc/presentation/home/widgets/DeviceItemIconWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../data/repository/device_detail_repository.dart';
import '../common/utils/Strings.dart';

class DeviceDetailScreen extends StatefulWidget {
  final DeviceInfoModel deviceInfoModel;

  DeviceDetailScreen({required this.deviceInfoModel, Key? key});

  @override
  State<StatefulWidget> createState() {
    return DeviceDetailState();
  }
}

class DeviceDetailState extends State<DeviceDetailScreen> {
  final String header = Strings.header_device_detail;
  late final DeviceDetailRepository deviceDetailRepository;
  late final DeviceDetailBloc deviceDetailBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    deviceDetailRepository = DeviceDetailRepository();
    deviceDetailBloc = DeviceDetailBloc(deviceDetailRepository);
    deviceDetailBloc.add(DeviceDetail(widget.deviceInfoModel.deviceId));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: BlocProvider<DeviceDetailBloc>(
        create: (context) => deviceDetailBloc,
        child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Text(header, style: TextStyle(fontSize: 18, color: Colors.black87, fontWeight: FontWeight.bold)),
              _getDeviceDetailWidget()
            ])),
      ),
    ));
  }

  Widget _getDeviceDetailWidget() {
    switch (widget.deviceInfoModel.deviceCategory.categoryType) {
      case DeviceCategoryType.AC:
        return ACDetailWidget(
          deviceInfoModel: widget.deviceInfoModel,
        );

      case DeviceCategoryType.TV:
        return TVDetailWidget(
          deviceInfoModel: widget.deviceInfoModel
        );

      case DeviceCategoryType.SMART_DOOR:
        return ACDetailWidget(
          deviceInfoModel: widget.deviceInfoModel,
        );

      default:
        return Container();
    }
  }
}
