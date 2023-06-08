import 'dart:developer';

import 'package:admin_dashboard/controllers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../constants/constants.dart';
import '../majdy/DashboardPage/components/graphbody.dart';
import 'bar_chart_users.dart';

class Users extends StatelessWidget {
  Users({Key? key}) : super(key: key);
  int month1counter = 0;
  int month2counter = 0;
  int month3counter = 0;
  int month4counter = 0;
  int month5counter = 0;
  int month6counter = 0;
  int month7counter = 0;
  int month8counter = 0;
  int month9counter = 0;
  int month10counter = 0;
  int month11counter = 0;
  int month12counter = 0;
  List<ChartData> getData(AuthProvider provider) {
    print(provider.personsDate.length);
    if (provider.personsDate.length > 0) {
      provider.personsDate.forEach((element) {
        print(element['join_date'] == '5');
        switch (element['join_date']) {
          case '1':
            month1counter++;
            break;
          case '2':
            month2counter++;
            break;
          case '3':
            month3counter++;
            break;
          case '4':
            month4counter++;

            break;
          case '5':
            month5counter++;

            break;
          case '6':
            month6counter++;

            break;
          case '7':
            month7counter++;

            break;
          case '8':
            month8counter++;

            break;
          case '9':
            month9counter++;

            break;
          case '10':
            month10counter++;

            break;
          case '11':
            month11counter++;

            break;
          case '12':
            month12counter++;

            break;
          default:
        }
      });
      List<ChartData> ddd = [
        // ChartData(category: 'Jan', value: 30),
        // ChartData(category: 'Feb', value: 40),
        // ChartData(category: 'Mar', value: 20),
        ChartData(
            category: 'Apr', value: double.parse(month4counter.toString())),
        ChartData(
            category: 'May', value: double.parse(month5counter.toString())),
        ChartData(
            category: 'Jun', value: double.parse(month6counter.toString())),
        ChartData(
            category: 'Jul', value: double.parse(month7counter.toString())),
        ChartData(
            category: 'Aug', value: double.parse(month8counter.toString())),
        ChartData(
            category: 'Sep', value: double.parse(month9counter.toString())),
        ChartData(
            category: 'Oct', value: double.parse(month10counter.toString())),
        ChartData(
            category: 'Nov', value: double.parse(month11counter.toString())),
        ChartData(
            category: 'Dec', value: double.parse(month12counter.toString())),
      ];
      return ddd;
    } else {
      return <ChartData>[];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, provider, w) {
      List<ChartData> deta = getData(provider);
      return Container(
        height: 400,
        width: double.infinity,
        padding: EdgeInsets.all(appPadding),
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Users",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 15,
                color: textColor,
              ),
            ),
            Expanded(
              // child: BarChartUsers(),
              child: SfCartesianChart(
                primaryXAxis: CategoryAxis(),
                series: <ChartSeries>[
                  LineSeries<ChartData, String>(
                    dataSource: deta,
                    xValueMapper: (ChartData chartData, _) =>
                        chartData.category,
                    yValueMapper: (ChartData chartData, _) => chartData.value,
                  ),
                ],
              ),
            )
          ],
        ),
      );
    });
  }
}

List<ChartData> data1 = [
  // ChartData(category: 'Jan', value: 30),
  // ChartData(category: 'Feb', value: 40),
  // ChartData(category: 'Mar', value: 20),
  ChartData(category: 'Apr', value: 10),
  ChartData(category: 'May', value: 50),
  ChartData(category: 'Jun', value: 35),
  ChartData(category: 'Jul', value: 35),
  ChartData(category: 'Aug', value: 35),
  ChartData(category: 'Sep', value: 35),
  ChartData(category: 'Nov', value: 35),
  ChartData(category: 'Dec', value: 35),
];
