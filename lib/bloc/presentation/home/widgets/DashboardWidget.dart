import 'package:TA_IOT/bloc/domain/home/home_bloc.dart';
import 'package:TA_IOT/bloc/presentation/common/utils/AppAssets.dart';
import 'package:TA_IOT/bloc/presentation/common/utils/Utility.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeScreenState>(
        bloc: BlocProvider.of<HomeBloc>(context),
        builder: (context, state) {
          if (state is DashboardInfoLoadedState) {
            var dashboardInfoModel = state.dashboardModel;
            return Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle, // BoxShape.circle or BoxShape.retangle
                        color: Colors.white.withOpacity(.5),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(.2),
                            blurRadius: 20.0,
                          )
                        ]),
                    child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          Row(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                            Column(
                              children: [
                                Text(dashboardInfoModel.date.getFormattedDate()),
                                Padding(
                                    padding: EdgeInsets.all(20),
                                    child: Image.asset(
                                      AppAssets.sleep,
                                      height: 50,
                                      width: 50,
                                      fit: BoxFit.cover,
                                    ))
                              ],
                            ),
                            EnergyWidget()
                          ]),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              DashboardParamWidget(
                                  iconData: AppAssets.temperature, value: "${dashboardInfoModel.temperature}° C", paramName: "Temperature"),
                              DashboardParamWidget(iconData: AppAssets.humidity, value: "${dashboardInfoModel.humidity} %", paramName: "Humidity"),
                              DashboardParamWidget(iconData: AppAssets.devices, value: "10", paramName: "Total Devices")
                            ],
                          )
                        ]))));
          } else {
            return Container();
          }
        },
        buildWhen: (context, state) {
          if (state is DashboardInfoLoadedState) return true;
          return false;
        });
  }
}

class DashboardParamWidget extends StatelessWidget {
  final String value;
  final String paramName;
  final String iconData;

  const DashboardParamWidget({
    required this.value,
    required this.paramName,
    required this.iconData,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          iconData,
          height: 22,
          width: 22,
          fit: BoxFit.cover,
        ),
        const SizedBox(
          width: 8,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              value,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 1,
            ),
            Text(
              paramName,
              style: TextStyle(fontSize: 12, color: Colors.black87.withOpacity(.5)),
            )
          ],
        )
      ],
    );
  }
}

class EnergyWidget extends StatelessWidget {
  const EnergyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width * 0.44,
        height: 100,
        child: Stack(children: [
          Positioned(top: 0, child: Text("Energy Usage")),
          Positioned(
              top: 30,
              child: Text(
                "142.6",
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.blue),
              )),
          Positioned(
              right: 0,
              child: Image.asset(
                AppAssets.energy,
                height: 40,
                width: 40,
                fit: BoxFit.cover,
              )),
          Positioned(bottom: 0, right: 20, child: Text("Kwh"))
        ]));
  }
}
