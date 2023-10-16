import 'package:equatable/equatable.dart';

class DashboardModel extends Equatable {
  final String date = DateTime.now().toString();
  final int temperature;
  final double energyUsage;
  final int humidity;

  DashboardModel(this.temperature, this.humidity, this.energyUsage);

  @override
  List<Object?> get props => [temperature, energyUsage, humidity];
}
