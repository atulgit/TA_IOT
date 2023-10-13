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

  AirConditioner? airConditioner;
  Television? television;

  DeviceInfoModel(this.deviceId, this.deviceCategory, this.deviceCaption, this.deviceImagePath, this.deviceName, this.deviceState, this.energyUsage,
      {this.airConditioner, this.television});

  @override
  List<Object?> get props => [deviceState];
}

enum AirConditionerModes { COOL, DRY }

enum TelevisionPictureModes { STANDARD }

enum TelevisionSoundModes { ROCK, JAZZ, MOVIE, MUSIC }

class AirConditioner {
  AirConditionerModes mode;
  int temperature = 0;
  double humidity = 0.0;

  AirConditioner(this.mode, this.humidity, this.temperature);
}

class Television {
  int brightness = 0;
  TelevisionPictureModes pictureMode = TelevisionPictureModes.STANDARD;
  TelevisionSoundModes soundMode = TelevisionSoundModes.JAZZ;

  Television(this.brightness, this.pictureMode, this.soundMode);
}

class SmartDoor {}
