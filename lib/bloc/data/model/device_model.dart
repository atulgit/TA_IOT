import 'package:equatable/equatable.dart';

import 'device_category.dart';

class DeviceInfoModel extends Equatable {
  int deviceId = -1;
  String deviceName = "";
  String deviceCaption = "";
  int deviceState = 0;
  double energyUsage = 0.0;
  int usageTime = 0;
  String deviceImagePath = "";
  late DeviceCategory deviceCategory;

  AirConditionerModel? airConditioner;
  TelevisionModel? television;

  DeviceInfoModel(this.deviceId, this.deviceCategory, this.deviceCaption, this.deviceImagePath, this.deviceName, this.deviceState, this.energyUsage,
      {this.airConditioner, this.television});

  @override
  List<Object?> get props => [deviceState, deviceId, deviceName];
}

enum AirConditionerModes {
  Cool(0),
  Dry(1),
  Sleep(2);

  const AirConditionerModes(this.value);

  final int value;
}

class MyEnum1 {
  static String get hello => "Hello";
  static int get seven => 7;
}

enum TelevisionPictureModes { STANDARD, DYNAMIC, HDR_CINEMA, HDR_STANDARD }

enum TelevisionSoundModes { ROCK, JAZZ, MOVIE, MUSIC }

class AirConditionerModel {
  AirConditionerModes mode;
  int temperature = 25;
  double humidity = 0.0;

  AirConditionerModel(this.mode, this.humidity, this.temperature);
}

class TelevisionModel {
  int brightness = 0;
  TelevisionPictureModes pictureMode = TelevisionPictureModes.STANDARD;
  TelevisionSoundModes soundMode = TelevisionSoundModes.JAZZ;

  TelevisionModel(this.brightness, this.pictureMode, this.soundMode);
}

class SmartDoor {}
