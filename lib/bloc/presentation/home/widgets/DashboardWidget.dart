import 'package:TA_IOT/bloc/domain/home/home_bloc.dart';
import 'package:TA_IOT/bloc/presentation/common/utils/AppAssets.dart';
import 'package:TA_IOT/bloc/presentation/common/utils/Strings.dart';
import 'package:TA_IOT/bloc/presentation/common/utils/Utility.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'DashboardParamWidget.dart';
import 'EnergyWidget.dart';

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
                            EnergyWidget(
                              energyValue: dashboardInfoModel.energyUsage,
                            )
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
