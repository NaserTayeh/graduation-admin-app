import 'dart:developer';

import 'package:admin_dashboard/controllers/auth_provider.dart';
import 'package:admin_dashboard/models/coach_model.dart';
import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:provider/provider.dart';

class CoachTable extends StatefulWidget {
  const CoachTable({Key? key}) : super(key: key);

  @override
  State<CoachTable> createState() => _CoachTableState();
}

class _CoachTableState extends State<CoachTable> {
  final List<PlutoColumn> columns = <PlutoColumn>[
    PlutoColumn(
      title: 'Id',
      field: 'id',
      type: PlutoColumnType.text(),
    ),
    PlutoColumn(
      title: 'Name',
      field: 'name',
      type: PlutoColumnType.text(),
    ),
    PlutoColumn(
      title: 'Age',
      field: 'age',
      type: PlutoColumnType.text(),
    ),
    PlutoColumn(title: 'email', field: 'email', type: PlutoColumnType.text()),
    PlutoColumn(
      title: 'Year_of_exp',
      field: 'year_of_exp',
      type: PlutoColumnType.text(),
    ),
    PlutoColumn(
      title: 'coaching_Foucs',
      field: 'coaching_Foucs',
      type: PlutoColumnType.text(),
    ),
    PlutoColumn(
      title: 'Gender',
      field: 'Gender',
      type: PlutoColumnType.text(),
    ),
    PlutoColumn(
      title: 'subscription_tax',
      field: 'subscription_tax',
      type: PlutoColumnType.text(),
    ),
    PlutoColumn(
      title: 'Number of Trainee',
      field: 'Number of Trainee',
      type: PlutoColumnType.text(),
    ),
    PlutoColumn(
      title: 'salary',
      field: 'salary',
      type: PlutoColumnType.currency(),
      footerRenderer: (rendererContext) {
        return PlutoAggregateColumnFooter(
          rendererContext: rendererContext,
          formatAsCurrency: true,
          type: PlutoAggregateColumnType.sum,
          format: '#,###',
          alignment: Alignment.center,
          titleSpanBuilder: (text) {
            return [
              const TextSpan(
                text: 'Sum',
                style: TextStyle(color: Colors.red),
              ),
              const TextSpan(text: ' : '),
              TextSpan(text: text),
            ];
          },
        );
      },
    ),
  ];

  final List<PlutoRow> row = [
    // PlutoRow(
    //   cells: {
    //     'id': PlutoCell(value: 'user1'),
    //     'name': PlutoCell(value: 'Mike'),
    //     'age': PlutoCell(value: e.age),
    //     'email': PlutoCell(value: 'Programmer'),
    //     'year_of_exp': PlutoCell(value: '12'),
    //     'coaching_Foucs': PlutoCell(value: '1'),
    //     'Gender': PlutoCell(value: '1'),
    //     'subscription_tax': PlutoCell(value: ' 1'),
    //     'Number of Trainee': PlutoCell(value: '1'),
    //     'salary': PlutoCell(value: 300),
    //   },
    // ),
    // PlutoRow(
    //   cells: {
    //     'id': PlutoCell(value: 'user2'),
    //     'name': PlutoCell(value: 'Jack'),
    //     'age': PlutoCell(value: 25),
    //     'email': PlutoCell(value: 'Designer'),
    //     'password': PlutoCell(value: '2021-02-01'),
    //     'account_status': PlutoCell(value: '10:00'),
    //     'salary': PlutoCell(value: 400),
    //   },
    // ),
    // PlutoRow(
    //   cells: {
    //     'id': PlutoCell(value: 'user3'),
    //     'name': PlutoCell(value: 'Suzi'),
    //     'age': PlutoCell(value: 40),
    //     'email': PlutoCell(value: 'Owner'),
    //     'password': PlutoCell(value: '2021-03-01'),
    //     'account_status': PlutoCell(value: '11:00'),
    //     'salary': PlutoCell(value: 700),
    //   },
    // ),
  ];

  /// columnGroups that can group columns can be omitted.
  final List<PlutoColumnGroup> columnGroups = [
    PlutoColumnGroup(title: 'Id', fields: ['id'], expandedColumn: true),
    PlutoColumnGroup(title: 'Name', fields: ['name'], expandedColumn: true),
  ];
  List<PlutoRow> getData(AuthProvider provider) {
    return provider.allCoaches
        .map((e) => PlutoRow(
              cells: {
                'id': PlutoCell(value: e.coachId),
                'name': PlutoCell(value: e.fullName),
                'age': PlutoCell(value: e.age),
                'email': PlutoCell(value: 'user@gmail.com'),
                'year_of_exp': PlutoCell(value: e.yearOfExp),
                'coaching_Foucs': PlutoCell(value: e.coachingFoucs),
                'Gender': PlutoCell(value: e.gender),
                'subscription_tax': PlutoCell(value: e.subscriptionTax),
                'Number of Trainee': PlutoCell(value: e.numOfTrainee),
                'salary': PlutoCell(value: int.parse(e.salary)),
              },
            ))
        .toList();
  }

  late final PlutoGridStateManager stateManager;

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, provider, w) {
      var rows = getData(provider);
      return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          iconTheme: const IconThemeData(color: Colors.black),
          elevation: 0.0,
        ),
        body: Container(
          padding: const EdgeInsets.all(15),
          child: PlutoGrid(
            columns: columns,
            rows: rows,
            columnGroups: columnGroups,
            onLoaded: (PlutoGridOnLoadedEvent event) {
              stateManager = event.stateManager;
              stateManager.setShowColumnFilter(true);
            },
            onChanged: (PlutoGridOnChangedEvent event) {
              print(event);
            },
            configuration: const PlutoGridConfiguration(),
          ),
        ),
      );
    });
  }
}
