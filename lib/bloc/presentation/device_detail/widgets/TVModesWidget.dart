import 'package:TA_IOT/bloc/presentation/device_detail/widgets/TVButtonsItemWidget.dart';
import 'package:flutter/cupertino.dart';

import '../../common/utils/AppAssets.dart';
import 'ACModelWidget.dart';

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
          mode: "Brightness",
          icon: AppAssets.brightness,
        ),
        TVButtonItemWidget(
          mode: "Contrast",
          icon: AppAssets.contrast,
        ),
        TVButtonItemWidget(
          mode: "Volume",
          icon: AppAssets.volume,
        )
      ],
    );
  }
}
