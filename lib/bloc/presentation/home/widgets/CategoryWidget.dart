import 'package:TA_IOT/bloc/data/model/device_category.dart';
import 'package:TA_IOT/bloc/domain/home/home_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/styles/DeviceItemStyle.dart';
import '../../common/utils/AppAssets.dart';

class CategoryWidget extends StatelessWidget {
  final DeviceCategory deviceCategory;
  bool isSelected = false;
  final String image;

  CategoryWidget({
    this.isSelected = false,
    required this.image,
    required this.deviceCategory,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var homeBloc = BlocProvider.of<HomeBloc>(context);
    return Padding(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: InkWell(
            onTap: () {
              homeBloc.add(CategorySelectedEvent(deviceCategory.categoryType));
            },
            child: Container(
              height: 40,
              // width: 70,
              decoration: CommonStyle.getCategoryDecorator(color: !isSelected ? Colors.blue.withOpacity(.2) : Colors.blue.withOpacity(.5)),
              child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (image.isNotEmpty)
                        Image.asset(
                          image,
                          height: 30,
                          fit: BoxFit.cover,
                        ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        deviceCategory.categoryName,
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black54),
                      )
                    ],
                  )),
            )));
  }
}
