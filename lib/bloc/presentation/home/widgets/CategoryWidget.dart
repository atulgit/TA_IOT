import 'package:TA_IOT/bloc/data/model/device_category.dart';
import 'package:TA_IOT/bloc/domain/home/home_bloc.dart';
import 'package:TA_IOT/bloc/presentation/common/styles/TextStyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/styles/DeviceItemStyle.dart';
import '../../common/utils/AppAssets.dart';

class CategoryWidget extends StatelessWidget {
  final DeviceCategory _deviceCategory;
  bool _isSelected = false;
  final String _image;

  CategoryWidget({
    bool isSelected = false,
    required String image,
    required DeviceCategory deviceCategory,
    super.key,
  }) : _isSelected = isSelected, _deviceCategory = deviceCategory, _image = image;

  @override
  Widget build(BuildContext context) {
    var homeBloc = BlocProvider.of<HomeBloc>(context);
    return Padding(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: InkWell(
            onTap: () {
              homeBloc.add(CategorySelectedEvent(_deviceCategory.categoryType));
            },
            child: Container(
              height: 40,
              // width: 70,
              decoration: CommonStyle.getCategoryDecorator(color: !_isSelected ? Colors.blue.withOpacity(.2) : Colors.blue.withOpacity(.5)),
              child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (_image.isNotEmpty)
                        Image.asset(
                          _image,
                          height: 30,
                          fit: BoxFit.cover,
                        ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        _deviceCategory.categoryName,
                        style: DeviceCategoryTextStyles.categoryNameStyle,
                      )
                    ],
                  )),
            )));
  }
}
