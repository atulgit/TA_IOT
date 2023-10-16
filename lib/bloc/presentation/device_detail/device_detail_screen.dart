import 'package:ta_iot/bloc/data/model/device_category_model.dart';
import 'package:ta_iot/bloc/data/model/device_model.dart';
import 'package:ta_iot/bloc/domain/device_detail/device_detail_bloc.dart';
import 'package:ta_iot/bloc/presentation/device_detail/widgets/ac_detail_widget.dart';
import 'package:ta_iot/bloc/presentation/device_detail/widgets/tv_detail_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repository/device_detail_repository.dart';
import '../common/utils/strings.dart';

class DeviceDetailScreen extends StatefulWidget {
  final DeviceInfoModel _deviceInfoModel;

  DeviceDetailScreen({required DeviceInfoModel deviceInfoModel, Key? key}) : _deviceInfoModel = deviceInfoModel;

  @override
  State<StatefulWidget> createState() {
    return DeviceDetailState();
  }
}

class DeviceDetailState extends State<DeviceDetailScreen> {
  final String _header = Strings.headerDeviceDetail;
  late final DeviceDetailRepository _deviceDetailRepository;
  late final DeviceDetailBloc _deviceDetailBloc;

  @override
  void initState() {
    super.initState();

    _deviceDetailRepository = DeviceDetailRepository();
    _deviceDetailBloc = DeviceDetailBloc(_deviceDetailRepository);
    _deviceDetailBloc.add(DeviceDetail(widget._deviceInfoModel.deviceId));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: BlocProvider<DeviceDetailBloc>(
        create: (context) => _deviceDetailBloc,
        child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Text(_header, style: TextStyle(fontSize: 18, color: Colors.black87, fontWeight: FontWeight.bold)),
              _getDeviceDetailWidget()
            ])),
      ),
    ));
  }

  Widget _getDeviceDetailWidget() {
    switch (widget._deviceInfoModel.deviceCategory.categoryType) {
      case DeviceCategoryType.AC:
        return ACDetailWidget(
          deviceInfoModel: widget._deviceInfoModel,
        );

      case DeviceCategoryType.TV:
        return TVDetailWidget(
          deviceInfoModel: widget._deviceInfoModel
        );

      case DeviceCategoryType.SMART_DOOR:
        return ACDetailWidget(
          deviceInfoModel: widget._deviceInfoModel,
        );

      default:
        return Container();
    }
  }
}
