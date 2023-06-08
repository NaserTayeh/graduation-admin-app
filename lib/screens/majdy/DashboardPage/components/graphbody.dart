import 'package:admin_dashboard/controllers/auth_provider.dart';
import 'package:admin_dashboard/models/coach_model.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../table_screen.dart';
import 'data_table.dart';

//import 'pie_chart.dart';

class ChartGrapfhBody extends StatelessWidget {
  const ChartGrapfhBody({super.key});

  @override
  Widget build(BuildContext context) {
    List<ChartData> data2 = [
      ChartData(category: 'Category A', value: 30),
      ChartData(category: 'Category B', value: 40),
      ChartData(category: 'Category C', value: 20),
      ChartData(category: 'Category D', value: 10),
    ];
    List<ChartData> data1 = [
      ChartData(category: 'Jan', value: 30),
      ChartData(category: 'Feb', value: 40),
      ChartData(category: 'Mar', value: 20),
      ChartData(category: 'Apr', value: 10),
      ChartData(category: 'May', value: 50),
      ChartData(category: 'Jun', value: 35),
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 25,
            ),
            const Center(
              child: Text(
                "Salaries and Clients",
                style: TextStyle(fontSize: 20),
              ),
            ),
            BarChart(),
            // LineChartWidget(data: data1),
            const SizedBox(
              height: 65,
            ),
            const Center(
              child: Text(
                "Market Category Sells",
                style: TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.circle,
                      size: 10,
                      color: Colors.redAccent,
                    ),
                    Text('Protien'),
                  ],
                ),
                SizedBox(
                  width: 5,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.circle,
                      size: 10,
                      color: Colors.blueAccent,
                    ),
                    Text('Amino'),
                  ],
                ),
                SizedBox(
                  width: 5,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.circle,
                      size: 10,
                      color: Colors.greenAccent,
                    ),
                    Text('Dumbell'),
                  ],
                ),
                SizedBox(
                  width: 5,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.circle,
                      size: 10,
                      color: Colors.amber,
                    ),
                    Text('Snack'),
                  ],
                ),
              ],
            ),
            PieChartWidget(data: data2),
            const SizedBox(
              height: 25,
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(AdminPage());
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (context) => PlutoGridExamplePage(),
                //   ),
                // );
              },
              child: Text('View DataTable'),
            )
          ],
        ),
      ),
    );
  }
}

class LineChartWidget extends StatelessWidget {
  final List<ChartData> data;

  LineChartWidget({required this.data});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SfCartesianChart(
        primaryXAxis: CategoryAxis(),
        series: <ChartSeries>[
          LineSeries<ChartData, String>(
            dataSource: data,
            xValueMapper: (ChartData chartData, _) => chartData.category,
            yValueMapper: (ChartData chartData, _) => chartData.value,
          ),
        ],
      ),
    );
  }
}

class PieChartWidget extends StatelessWidget {
  final List<ChartData> data;

  PieChartWidget({required this.data});
  final List<ChartData2> chartData = [
    ChartData2('Protien', 25, Colors.redAccent),
    ChartData2('Amino', 38, Colors.blueAccent),
    ChartData2('Dumbell', 34, Colors.amberAccent),
    ChartData2('Snack', 52, Colors.greenAccent)
  ];
  List<ChartData2> getData(AuthProvider provider) {
    int protienCount = 0;
    int aminoCount = 0;
    int snackCount = 0;
    int dumbellCount = 0;
    provider.allCheckoutsData.forEach((element) {
      switch (element['category']) {
        case 0:
          protienCount++;

          break;
        case 1:
          aminoCount++;

          break;
        case 2:
          snackCount++;

          break;
        case 3:
          dumbellCount++;

          break;
        default:
      }
    });
    print("protien count = $protienCount");

    return [
      ChartData2(
          'Protien', double.parse(protienCount.toString()), Colors.redAccent),
      ChartData2(
          'Amino', double.parse(aminoCount.toString()), Colors.blueAccent),
      ChartData2(
          'Dumbell', double.parse(dumbellCount.toString()), Colors.amberAccent),
      ChartData2(
          'Snack', double.parse(snackCount.toString()), Colors.greenAccent)
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, provider, w) {
      var tmpDate = getData(provider);
      return Center(
          child: Container(
              child: SfCircularChart(series: <CircularSeries>[
        // Render pie chart
        PieSeries<ChartData2, String>(
            enableTooltip: true,
            explodeAll: true,
            dataSource: tmpDate,
            pointColorMapper: (ChartData2 data, _) => data.color,
            xValueMapper: (ChartData2 data, _) => data.x,
            yValueMapper: (ChartData2 data, _) => data.y,
            // name: 'naser',
            dataLabelSettings: DataLabelSettings(
              isVisible: true,
            )),
      ]))
          // SfCircularChart(
          //   series: <CircularSeries>[
          //     PieSeries<ChartData, String>(
          //       dataSource: data,
          //       xValueMapper: (ChartData chartData, _) => chartData.category,
          //       yValueMapper: (ChartData chartData, _) => chartData.value,
          //       dataLabelSettings: DataLabelSettings(
          //         isVisible: true,
          //       ),
          //     ),
          //   ],
          // ),
          );
    });
  }
}

class ChartData {
  final String category;
  final double value;

  ChartData({required this.category, required this.value});
}

class ChartData2 {
  ChartData2(this.x, this.y, [this.color]);
  final String x;
  final double y;
  final Color? color;
}

class BarChart extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  BarChart({Key? key}) : super(key: key);

  @override
  BarChartState createState() => BarChartState();
}

class BarChartState extends State<BarChart> {
  late List<_ChartData> data;
  late TooltipBehavior _tooltip;

  @override
  void initState() {
    data = [
      _ChartData('Naser', 12),
      _ChartData('Ahmad', 15),
      _ChartData('Rami', 30),
      _ChartData('Khaled', 6.4),
      _ChartData('Jamed', 14)
    ];
    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

  List<_ChartData> getData(AuthProvider provider) {
    return provider.allCoaches
        .map((e) => _ChartData(e.fullName, double.parse(e.salary)))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, provider, w) {
      var tmpData = getData(provider);
      return SfCartesianChart(
          primaryXAxis: CategoryAxis(),
          // primaryYAxis: NumericAxis(minimum: 0, maximum: 40, interval: 10),
          tooltipBehavior: _tooltip,
          series: <ChartSeries<_ChartData, String>>[
            ColumnSeries<_ChartData, String>(
                dataSource: tmpData,
                xValueMapper: (_ChartData data, _) => data.x,
                yValueMapper: (_ChartData data, _) => data.y,
                name: 'Salary',
                color: Color.fromRGBO(8, 142, 255, 1))
          ]);
    });
  }
}

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}
