class DashboardModel {
  String date = DateTime.now().toString();
  int temperature = 0;
  double energyUsage = 0;
  int humidity = 0;

  DashboardModel(this.temperature, this.humidity, this.energyUsage);
}
