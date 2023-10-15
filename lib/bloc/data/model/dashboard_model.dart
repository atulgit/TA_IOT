import 'package:equatable/equatable.dart';

class DashboardModel extends Equatable {
  String date = DateTime.now().toString();
  int temperature = 0;
  double energyUsage = 0;
  int humidity = 0;

  DashboardModel(this.temperature, this.humidity, this.energyUsage);

  @override
  List<Object?> get props => [temperature, energyUsage, humidity];
}
