import 'package:TA_IOT/bloc/domain/device_detail/device_detail_bloc.dart';
import 'package:TA_IOT/bloc/presentation/common/utils/strings.dart';
import 'package:TA_IOT/bloc/presentation/device_detail/widgets/tv_buttons_item_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/utils/app_assets.dart';
import 'ac_model_widget.dart';

class TVModesWidget extends StatelessWidget {
  const TVModesWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TVButtonItemWidget(
          mode: Strings.brightness,
          icon: AppAssets.brightness,
        ),
        TVButtonItemWidget(
          mode: Strings.contrast,
          icon: AppAssets.contrast,
        ),
        InkWell(
            onTap: () {
              var deviceDetailBloc = BlocProvider.of<DeviceDetailBloc>(context);
              deviceDetailBloc.add(TVVolumeEvent());
            },
            child: BlocBuilder(
                bloc: BlocProvider.of<DeviceDetailBloc>(context),
                builder: (context, state) {
                  if (state is TVVolumeState) {
                    return _getVolumeWidget(state.isMute);
                  } else if (state is DeviceDetailState) {
                    return _getVolumeWidget(false);
                  } else {
                    return Container();
                  }
                },
                buildWhen: (context, state) {
                  if (state is TVVolumeState) return true;
                  return false;
                }))
      ],
    );
  }

  Widget _getVolumeWidget(bool isMute) {
    return TVButtonItemWidget(
      mode: Strings.volume,
      icon: isMute ? AppAssets.mute : AppAssets.volume,
    );
  }
}
