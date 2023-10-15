import 'package:TA_IOT/bloc/presentation/common/styles/TextStyles.dart';
import 'package:TA_IOT/bloc/presentation/common/utils/AppAssets.dart';
import 'package:TA_IOT/bloc/presentation/common/utils/Strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/device_category.dart';
import '../../../domain/home/home_bloc.dart';
import 'CategoryWidget.dart';

class CategoryListWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CategoryListWidgetState();
  }
}

class CategoryListWidgetState extends State<CategoryListWidget> {
  late final HomeBloc _homeBloc;

  CategoryListWidgetState({
    Key? key,
  });

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
          deviceCategory: DeviceCategory(DeviceCategoryType.ALL, "ALL", ""),
          isSelected: type == DeviceCategoryType.ALL,
          image: "",
        ),
        CategoryWidget(
          deviceCategory: DeviceCategory(DeviceCategoryType.AC, "Air Conditioner", ""),
          isSelected: type == DeviceCategoryType.AC,
          image: AppAssets.ac,
        ),
        CategoryWidget(
          deviceCategory: DeviceCategory(DeviceCategoryType.TV, "Television", ""),
          isSelected: type == DeviceCategoryType.TV,
          image: AppAssets.tv_thumb,
        ),
      ]),
    ]);
  }
}
