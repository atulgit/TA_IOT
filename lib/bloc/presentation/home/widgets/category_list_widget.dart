import 'package:ta_iot/bloc/presentation/common/styles/text_styles.dart';
import 'package:ta_iot/bloc/presentation/common/utils/app_assets.dart';
import 'package:ta_iot/bloc/presentation/common/utils/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/device_category_model.dart';
import '../../../domain/home/home_bloc.dart';
import 'category_widget.dart';

class CategoryListWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CategoryListWidgetState();
  }
}

class _CategoryListWidgetState extends State<CategoryListWidget> {
  late final HomeBloc _homeBloc;

  _CategoryListWidgetState();

  @override
  void initState() {
    super.initState();
    _homeBloc = BlocProvider.of<HomeBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeScreenState>(builder: (context, state) {
      if (state is DeviceListLoaded || state is CategorySelectedState) {
        return _getCategoryList(_homeBloc.selectedCategory);
      }

      return Container();
    }, buildWhen: (context, state) {
      if (state is DeviceListLoaded || state is CategorySelectedState)
        return true;
      else
        return false;
    });
  }

  Widget _getCategoryList(DeviceCategoryType type) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
          padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 20),
          child: Text(
            Strings.deviceCategory,
            style: DeviceCategoryTextStyles.headerStyle,
          )),
      Row(children: [
        CategoryWidget(
          deviceCategory: DeviceCategoryModel(DeviceCategoryType.ALL, "ALL", ""),
          isSelected: type == DeviceCategoryType.ALL,
          image: "",
        ),
        CategoryWidget(
          deviceCategory: DeviceCategoryModel(DeviceCategoryType.AC, "Air Conditioner", ""),
          isSelected: type == DeviceCategoryType.AC,
          image: AppAssets.ac,
        ),
        CategoryWidget(
          deviceCategory: DeviceCategoryModel(DeviceCategoryType.TV, "Television", ""),
          isSelected: type == DeviceCategoryType.TV,
          image: AppAssets.tv_thumb,
        ),
      ]),
    ]);
  }
}
