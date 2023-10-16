import 'package:ta_iot/bloc/data/model/device_category_model.dart';
import 'package:ta_iot/bloc/domain/home/home_bloc.dart';
import 'package:ta_iot/bloc/presentation/common/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../common/styles/device_item_style.dart';

class CategoryWidget extends StatelessWidget {
  final DeviceCategoryModel _deviceCategory;
  final bool _isSelected;
  final String _image;

  CategoryWidget({
    bool isSelected = false,
    required String image,
    required DeviceCategoryModel deviceCategory,
    super.key,
  })  : _isSelected = isSelected,
        _deviceCategory = deviceCategory,
        _image = image;

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
