import 'package:equatable/equatable.dart';

//ignore: must_be_immutable
class DeviceCategoryModel extends Equatable {
  late DeviceCategoryType categoryType;
  String categoryName = "";
  String categoryImage = "";

   DeviceCategoryModel(this.categoryType, this.categoryName, this.categoryImage);

  DeviceCategoryModel.fromJson(Map<String, dynamic> json) {
    categoryType = json['categoryId'];
    categoryName = json['categoryName'];
    categoryImage = json['categoryImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categoryType'] = this.categoryType;
    data['categoryName'] = this.categoryName;
    data['categoryImage'] = this.categoryImage;
    return data;
  }

  @override
  List<Object?> get props => [categoryType, categoryName, categoryName];
}

enum DeviceCategoryType { ALL, AC, TV, SMART_DOOR }
