class DeviceCategory {
  late DeviceCategoryType categoryType;
  String categoryName = "";
  String categoryImage = "";

  DeviceCategory(this.categoryType, this.categoryName, this.categoryImage);

  DeviceCategory.fromJson(Map<String, dynamic> json) {
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
}

enum DeviceCategoryType { AC, TV, SMART_DOOR }
