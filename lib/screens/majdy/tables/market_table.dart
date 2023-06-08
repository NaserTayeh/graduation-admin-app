import 'package:admin_dashboard/controllers/auth_provider.dart';
import 'package:admin_dashboard/models/market_model.dart';
import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:provider/provider.dart';

class MarketTable extends StatefulWidget {
  const MarketTable({Key? key}) : super(key: key);

  @override
  State<MarketTable> createState() => _MarketTableState();
}

class _MarketTableState extends State<MarketTable> {
  final List<PlutoColumn> columns = <PlutoColumn>[
    PlutoColumn(
      title: 'Id',
      field: 'id',
      type: PlutoColumnType.text(),
    ),
    PlutoColumn(
      title: 'supplement_name',
      field: 'supplement_name',
      type: PlutoColumnType.text(),
    ),
    PlutoColumn(
      title: 'supplement_desc',
      field: 'supplement_desc',
      type: PlutoColumnType.text(),
    ),
    PlutoColumn(
      title: 'Protein',
      field: 'Protein',
      type: PlutoColumnType.text(),
    ),
    PlutoColumn(
      title: 'Carbohydrates',
      field: 'Carbohydrates',
      type: PlutoColumnType.text(),
    ),
    PlutoColumn(
      title: 'fats',
      field: 'fats',
      type: PlutoColumnType.text(),
    ),
    PlutoColumn(
      title: 'Vitamins',
      field: 'Vitamins',
      type: PlutoColumnType.text(),
    ),
    PlutoColumn(
      title: 'hydration',
      field: 'hydration',
      type: PlutoColumnType.text(),
    ),
    PlutoColumn(
      title: 'Quantity_Stock',
      field: 'Quantity_Stock',
      type: PlutoColumnType.text(),
    ),
    PlutoColumn(
      title: 'price',
      field: 'price',
      type: PlutoColumnType.text(),
    ),
    PlutoColumn(
      title: 'categorie',
      field: 'categorie',
      type: PlutoColumnType.text(),
    ),
  ];

  final List<PlutoRow> row = [
    PlutoRow(
      cells: {
        'id': PlutoCell(value: 'user1'),
        'supplement_name': PlutoCell(value: 'Mike'),
        'supplement_desc': PlutoCell(value: '00'),
        'Protein': PlutoCell(value: 'Programmer'),
        'Carbohydrates': PlutoCell(value: '12'),
        'fats': PlutoCell(value: '1'),
        'Vitamins': PlutoCell(value: '1'),
        'hydration': PlutoCell(value: ' 1'),
        'Quantity_Stock': PlutoCell(value: '1'),
        'price': PlutoCell(value: 300),
        'categorie': PlutoCell(value: 300),
      },
    ),
  ];
  List<PlutoRow> getData(AuthProvider provider) {
    return provider.allSupplement
        .map(
          (e) => PlutoRow(
            cells: {
              'id': PlutoCell(
                value: e.supplementId,
              ),
              'supplement_name': PlutoCell(
                value: e.supplementName,
              ),
              'supplement_desc': PlutoCell(
                value: e.supplementDesc,
              ),
              'Protein': PlutoCell(
                value: e.protein,
              ),
              'Carbohydrates': PlutoCell(
                value: e.carbohydrates,
              ),
              'fats': PlutoCell(
                value: e.fats,
              ),
              'Vitamins': PlutoCell(
                value: e.vitamins,
              ),
              'hydration': PlutoCell(
                value: e.hydration,
              ),
              'Quantity_Stock': PlutoCell(
                value: e.quantityStock,
              ),
              'price': PlutoCell(
                value: e.price,
              ),
              'categorie': PlutoCell(value: e.categorie),
            },
          ),
        )
        .toList();
  }

  /// columnGroups that can group columns can be omitted.
  final List<PlutoColumnGroup> columnGroups = [
    PlutoColumnGroup(title: 'Id', fields: ['id'], expandedColumn: true),
    PlutoColumnGroup(title: 'Name', fields: ['name'], expandedColumn: true),
  ];

  /// [PlutoGridStateManager] has many methods and properties to dynamically manipulate the grid.
  /// You can manipulate the grid dynamically at runtime by passing this through the [onLoaded] callback.
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
