import 'package:TA_IOT/bloc/presentation/common/utils/Strings.dart';
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
          mode: Strings.brightness,
          icon: AppAssets.brightness,
        ),
        TVButtonItemWidget(
          mode: Strings.contrast,
          icon: AppAssets.contrast,
        ),
        TVButtonItemWidget(
          mode: Strings.volume,
          icon: AppAssets.volume,
        )
      ],
    );
  }
}
