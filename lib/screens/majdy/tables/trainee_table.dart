// import 'package:flutter/material.dart';
// import 'package:pluto_grid/pluto_grid.dart';

// class TraineeTable extends StatefulWidget {
//   const TraineeTable({Key? key}) : super(key: key);

//   @override
//   State<TraineeTable> createState() => _TraineeTableState();
// }

// class _TraineeTableState extends State<TraineeTable> {
//   final List<PlutoColumn> columns = <PlutoColumn>[
//     PlutoColumn(
//       title: 'Id',
//       field: 'id',
//       type: PlutoColumnType.text(),
//     ),
//     PlutoColumn(
//       title: 'Name',
//       field: 'name',
//       type: PlutoColumnType.text(),
//     ),
//     PlutoColumn(
//       title: 'Height',
//       field: 'Height',
//       type: PlutoColumnType.text(),
//     ),
//     PlutoColumn(
//       title: 'Weight',
//       field: 'Weight',
//       type: PlutoColumnType.text(),
//     ),
//     PlutoColumn(
//       title: 'Age',
//       field: 'age',
//       type: PlutoColumnType.number(),
//     ),
//     PlutoColumn(
//       title: 'email',
//       field: 'email',
//       type: PlutoColumnType.select(<String>[
//         'Programmer',
//         'Designer',
//         'Owner',
//       ]),
//     ),
//     PlutoColumn(
//       title: 'Gender',
//       field: 'Gender',
//       type: PlutoColumnType.text(),
//     ),
//     PlutoColumn(
//       title: 'Fitness_level',
//       field: 'Fitness_level',
//       type: PlutoColumnType.text(),
//     ),
//     PlutoColumn(
//       title: 'montly_sub_pay',
//       field: 'montly_sub_pay',
//       type: PlutoColumnType.text(),
//     ),
//     PlutoColumn(
//       title: 'period',
//       field: 'period',
//       type: PlutoColumnType.text(),
//     ),
//     PlutoColumn(
//       title: 'start_date',
//       field: 'start_date',
//       type: PlutoColumnType.text(),
//     ),
//     PlutoColumn(
//       title: 'End_date',
//       field: 'End_date',
//       type: PlutoColumnType.text(),
//     ),
//     PlutoColumn(
//       title: 'is_prem',
//       field: 'is_prem',
//       type: PlutoColumnType.text(),
//     ),
//   ];

//   final List<PlutoRow> rows = [
//     PlutoRow(
//       cells: {
//         'id': PlutoCell(value: 'user1'),
//         'name': PlutoCell(value: 'Mike'),
//         'Height': PlutoCell(value: 'Mike'),
//         'Weight': PlutoCell(value: 'Mike'),
//         'age': PlutoCell(value: 20),
//         'email': PlutoCell(value: 'Programmer'),
//         'Gender': PlutoCell(value: '1'),
//         'Fitness_level': PlutoCell(value: '1'),
//         'montly_sub_pay': PlutoCell(value: '1'),
//         'period': PlutoCell(value: '1'),
//         'start_date': PlutoCell(value: '1'),
//         'End_date_date': PlutoCell(value: '1'),
//         'is_prem': PlutoCell(value: '1'),
//       },
//     ),
//     // PlutoRow(
//     //   cells: {
//     //     'id': PlutoCell(value: 'user2'),
//     //     'name': PlutoCell(value: 'Jack'),
//     //     'age': PlutoCell(value: 25),
//     //     'email': PlutoCell(value: 'Designer'),
//     //     'password': PlutoCell(value: '2021-02-01'),
//     //     'account_status': PlutoCell(value: '10:00'),
//     //     'salary': PlutoCell(value: 400),
//     //   },
//     // ),
//     // PlutoRow(
//     //   cells: {
//     //     'id': PlutoCell(value: 'user3'),
//     //     'name': PlutoCell(value: 'Suzi'),
//     //     'age': PlutoCell(value: 40),
//     //     'email': PlutoCell(value: 'Owner'),
//     //     'password': PlutoCell(value: '2021-03-01'),
//     //     'account_status': PlutoCell(value: '11:00'),
//     //     'salary': PlutoCell(value: 700),
//     //   },
//     // ),
//   ];

//   /// columnGroups that can group columns can be omitted.
//   final List<PlutoColumnGroup> columnGroups = [
//     PlutoColumnGroup(title: 'Id', fields: ['id'], expandedColumn: true),
//     PlutoColumnGroup(title: 'Name', fields: ['name'], expandedColumn: true),
//   ];

//   /// [PlutoGridStateManager] has many methods and properties to dynamically manipulate the grid.
//   /// You can manipulate the grid dynamically at runtime by passing this through the [onLoaded] callback.
//   late final PlutoGridStateManager stateManager;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color.fromARGB(255, 255, 255, 255),
//         iconTheme: const IconThemeData(color: Colors.black),
//         elevation: 0.0,
//       ),
//       body: Container(
//         padding: const EdgeInsets.all(15),
//         child: PlutoGrid(
//           columns: columns,
//           rows: rows,
//           columnGroups: columnGroups,
//           onLoaded: (PlutoGridOnLoadedEvent event) {
//             stateManager = event.stateManager;
//             stateManager.setShowColumnFilter(true);
//           },
//           onChanged: (PlutoGridOnChangedEvent event) {
//             print(event);
//           },
//           configuration: const PlutoGridConfiguration(),
//         ),
//       ),
//     );
//   }
// }
import 'package:admin_dashboard/controllers/auth_provider.dart';
import 'package:admin_dashboard/models/trainee_model.dart';
import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:provider/provider.dart';

class TraineeTable extends StatefulWidget {
  const TraineeTable({Key? key}) : super(key: key);

  @override
  State<TraineeTable> createState() => _TraineeTableState();
}

class _TraineeTableState extends State<TraineeTable> {
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
      title: 'Height',
      field: 'Height',
      type: PlutoColumnType.text(),
    ),
    PlutoColumn(
      title: 'Weight',
      field: 'Weight',
      type: PlutoColumnType.text(),
    ),
    PlutoColumn(
      title: 'Age',
      field: 'age',
      type: PlutoColumnType.text(),
    ),
    PlutoColumn(title: 'email', field: 'email', type: PlutoColumnType.text()),
    PlutoColumn(
      title: 'Gender',
      field: 'Gender',
      type: PlutoColumnType.text(),
    ),
    PlutoColumn(
      title: 'Fitness_level',
      field: 'Fitness_level',
      type: PlutoColumnType.text(),
    ),
    PlutoColumn(
      title: 'montly_sub_pay',
      field: 'montly_sub_pay',
      type: PlutoColumnType.text(),
    ),
    PlutoColumn(
      title: 'period',
      field: 'period',
      type: PlutoColumnType.text(),
    ),
    PlutoColumn(
      title: 'start_date',
      field: 'start_date',
      type: PlutoColumnType.text(),
    ),
    PlutoColumn(
      title: 'End_date',
      field: 'End_date',
      type: PlutoColumnType.text(),
    ),
    PlutoColumn(
      title: 'is_prem',
      field: 'is_prem',
      type: PlutoColumnType.text(),
    ),
  ];

  final List<PlutoRow> row = [
    PlutoRow(
      cells: {
        'id': PlutoCell(value: 'user1'),
        'name': PlutoCell(value: 'Mike'),
        'Height': PlutoCell(value: 'Mike'),
        'Weight': PlutoCell(value: 'Mike'),
        'age': PlutoCell(value: 20),
        'email': PlutoCell(value: 'Programmer'),
        'Gender': PlutoCell(value: '1'),
        'Fitness_level': PlutoCell(value: '1'),
        'montly_sub_pay': PlutoCell(value: '1'),
        'period': PlutoCell(value: '1'),
        'start_date': PlutoCell(value: '1'),
        'End_date': PlutoCell(value: '1'),
        'is_prem': PlutoCell(value: '1'),
      },
    ),
  ];

  /// columnGroups that can group columns can be omitted.
  final List<PlutoColumnGroup> columnGroups = [
    PlutoColumnGroup(title: 'Id', fields: ['id'], expandedColumn: true),
    PlutoColumnGroup(title: 'Name', fields: ['name'], expandedColumn: true),
  ];
  List<PlutoRow> getData(AuthProvider provider) {
    TraineeModel e;
    print(provider.allTrainee.length);

    return provider.allTrainee
        .map(
          (e) => PlutoRow(
            cells: {
              'id': PlutoCell(value: e.traineeId),
              'name': PlutoCell(value: e.fullName),
              'Height': PlutoCell(value: e.height),
              'Weight': PlutoCell(value: e.weight),
              'age': PlutoCell(value: e.age),
              'email': PlutoCell(value: 'Programmer@e.com'),
              'Gender': PlutoCell(value: e.gender),
              'Fitness_level': PlutoCell(value: e.fitnessLevel),
              'montly_sub_pay': PlutoCell(value: '100'),
              'period': PlutoCell(value: '6'),
              'start_date': PlutoCell(value: e.startDate),
              'End_date': PlutoCell(value: e.endDate),
              'is_prem': PlutoCell(value: e.isPrem),
            },
          ),
        )
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
            configuration: PlutoGridConfiguration(
                style: PlutoGridStyleConfig(
                    enableGridBorderShadow: true,
                    enableRowColorAnimation: true,
                    oddRowColor: Colors.grey.shade300,
                    evenRowColor: Colors.blue[200])),
          ),
        ),
      );
    });
  }
}
