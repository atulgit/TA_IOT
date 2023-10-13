import 'package:TA_IOT/bloc/presentation/device_detail/widgets/TVButtonsItemWidget.dart';
import 'package:flutter/cupertino.dart';

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
          icon: "assets/images/brightness.png",
        ),
        TVButtonItemWidget(
          mode: "Contrast",
          icon: "assets/images/contrast.png",
        ),
        TVButtonItemWidget(
          mode: "Volume",
          icon: "assets/images/volume.png",
        )
      ],
    );
  }
}
