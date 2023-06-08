import 'package:admin_dashboard/controllers/auth_provider.dart';
import 'package:admin_dashboard/models/recipe_model.dart';
import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:provider/provider.dart';

class RecipeTable extends StatefulWidget {
  const RecipeTable({Key? key}) : super(key: key);

  @override
  State<RecipeTable> createState() => _RecipeTableState();
}

class _RecipeTableState extends State<RecipeTable> {
  final List<PlutoColumn> columns = <PlutoColumn>[
    PlutoColumn(
      title: 'Id',
      field: 'id',
      type: PlutoColumnType.text(),
    ),
    PlutoColumn(
      title: 'recipe_name',
      field: 'recipe_name',
      type: PlutoColumnType.text(),
    ),
    PlutoColumn(
      title: 'recipe_desc',
      field: 'recipe_desc',
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
      title: 'calories',
      field: 'calories',
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
        'recipe_name': PlutoCell(value: 'Mike'),
        'recipe_desc': PlutoCell(value: '00'),
        'Protein': PlutoCell(value: 'Programmer'),
        'Carbohydrates': PlutoCell(value: '12'),
        'calories': PlutoCell(value: '1'),
        'categorie': PlutoCell(value: 300),
      },
    ),
  ];
  List<PlutoRow> getData(AuthProvider provider) {
    return provider.allRecipe
        .map(
          (e) => PlutoRow(
            cells: {
              'id': PlutoCell(value: e.recipe_id),
              'recipe_name': PlutoCell(value: e.title),
              'recipe_desc': PlutoCell(value: e.descr),
              'Protein': PlutoCell(value: e.protein),
              'Carbohydrates': PlutoCell(
                value: e.carb,
              ),
              'calories': PlutoCell(
                value: e.calu,
              ),
              'categorie': PlutoCell(value: e.category),
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
