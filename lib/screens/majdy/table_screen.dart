import 'package:admin_dashboard/screens/majdy/tables/market_table.dart';
import 'package:admin_dashboard/screens/majdy/tables/recipe_table.dart';
import 'package:flutter/material.dart';

// class AdminScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Admin Page'),
//       ),
//       body: Card(
//         child: SingleChildScrollView(
//           scrollDirection: Axis.horizontal,
//           child: DataTable(
//             columnSpacing: 16,
//             columns: [
//               DataColumn(
//                 label: Text(
//                   'Table Name',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//               DataColumn(
//                 label: Text(
//                   'Edit',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ],
//             rows: [
//               DataRow(
//                 cells: [
//                   DataCell(Text('Coaches')),
//                   DataCell(
//                     GestureDetector(
//                       onTap: () => Navigator.pushNamed(context, '/text-widget'),
//                       child: Container(
//                         padding:
//                             EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//                         decoration: BoxDecoration(
//                           color: Colors.blue,
//                           borderRadius: BorderRadius.circular(16),
//                         ),
//                         child: Text(
//                           'Edit',
//                           style: TextStyle(
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               DataRow(
//                 cells: [
//                   DataCell(Text('Trainee')),
//                   DataCell(
//                     GestureDetector(
//                       onTap: () =>
//                           Navigator.pushNamed(context, '/button-widget'),
//                       child: Container(
//                         padding:
//                             EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//                         decoration: BoxDecoration(
//                           color: Colors.blue,
//                           borderRadius: BorderRadius.circular(16),
//                         ),
//                         child: Text(
//                           'Edit',
//                           style: TextStyle(
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               DataRow(
//                 cells: [
//                   DataCell(Text('checkout')),
//                   DataCell(
//                     GestureDetector(
//                       onTap: () =>
//                           Navigator.pushNamed(context, '/button-widget'),
//                       child: Container(
//                         padding:
//                             EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//                         decoration: BoxDecoration(
//                           color: Colors.blue,
//                           borderRadius: BorderRadius.circular(16),
//                         ),
//                         child: Text(
//                           'Edit',
//                           style: TextStyle(
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               DataRow(
//                 cells: [
//                   DataCell(Text('Market')),
//                   DataCell(
//                     GestureDetector(
//                       onTap: () =>
//                           Navigator.pushNamed(context, '/button-widget'),
//                       child: Container(
//                         padding:
//                             EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//                         decoration: BoxDecoration(
//                           color: Colors.blue,
//                           borderRadius: BorderRadius.circular(16),
//                         ),
//                         child: Text(
//                           'Edit',
//                           style: TextStyle(
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               DataRow(
//                 cells: [
//                   DataCell(Text('recipe')),
//                   DataCell(
//                     GestureDetector(
//                       onTap: () =>
//                           Navigator.pushNamed(context, '/button-widget'),
//                       child: Container(
//                         padding:
//                             EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//                         decoration: BoxDecoration(
//                           color: Colors.blue,
//                           borderRadius: BorderRadius.circular(16),
//                         ),
//                         child: Text(
//                           'Edit',
//                           style: TextStyle(
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               // add more rows for each widget you want to display
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

// class AdminPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Admin Page'),
//       ),
//       body: SingleChildScrollView(
//         child: DataTable(
//           columns: const <DataColumn>[
//             DataColumn(
//               label: Text(
//                 'Widget Name',
//                 style: TextStyle(fontStyle: FontStyle.italic),
//               ),
//             ),
//             DataColumn(
//               label: Text(
//                 'Navigate',
//                 style: TextStyle(fontStyle: FontStyle.italic),
//               ),
//             ),
//           ],
//           rows: <DataRow>[
//             DataRow(
//               cells: <DataCell>[
//                 DataCell(Text('Dashboard Widget')),
//                 DataCell(ElevatedButton(
//                   onPressed: () {
//                     // Navigator.pushNamed(context, '/dashboard');
//                   },
//                   child: Text('Go'),
//                 )),
//               ],
//             ),
//             DataRow(
//               cells: <DataCell>[
//                 DataCell(Text('Users Widget')),
//                 DataCell(ElevatedButton(
//                   onPressed: () {},
//                   child: Text('Go'),
//                 )),
//               ],
//             ),
//             DataRow(
//               cells: <DataCell>[
//                 DataCell(Text('Classes Widget')),
//                 DataCell(ElevatedButton(
//                   onPressed: () {},
//                   child: Text('Go'),
//                 )),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';

// class AdminPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Admin Page'),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: DataTable(
//             headingRowHeight: 40,
//             dataRowHeight: 60,
//             columns: <DataColumn>[
//               DataColumn(
//                 label: Text(
//                   'Widget Name',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 16,
//                   ),
//                 ),
//               ),
//               DataColumn(
//                 label: Text(
//                   'Navigate',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 16,
//                   ),
//                 ),
//               ),
//             ],
//             rows: <DataRow>[
//               DataRow(
//                 cells: <DataCell>[
//                   DataCell(Text(
//                     'Dashboard Widget',
//                     style: TextStyle(fontSize: 16),
//                   )),
//                   DataCell(
//                     ElevatedButton(
//                       onPressed: () {
//                         Navigator.pushNamed(context, '/dashboard');
//                       },
//                       style: ElevatedButton.styleFrom(
//                         primary: Colors.orangeAccent,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(16),
//                         ),
//                       ),
//                       child: Text(
//                         'Go',
//                         style: TextStyle(fontSize: 16),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               DataRow(
//                 cells: <DataCell>[
//                   DataCell(Text(
//                     'Users Widget',
//                     style: TextStyle(fontSize: 16),
//                   )),
//                   DataCell(
//                     ElevatedButton(
//                       onPressed: () {
//                         Navigator.pushNamed(context, '/users');
//                       },
//                       style: ElevatedButton.styleFrom(
//                         primary: Colors.purpleAccent,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(16),
//                         ),
//                       ),
//                       child: Text(
//                         'Go',
//                         style: TextStyle(fontSize: 16),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               DataRow(
//                 cells: <DataCell>[
//                   DataCell(Text(
//                     'Classes Widget',
//                     style: TextStyle(fontSize: 16),
//                   )),
//                   DataCell(
//                     ElevatedButton(
//                       onPressed: () {
//                         Navigator.pushNamed(context, '/classes');
//                       },
//                       style: ElevatedButton.styleFrom(
//                         primary: Colors.blueAccent,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(16),
//                         ),
//                       ),
//                       child: Text(
//                         'Go',
//                         style: TextStyle(fontSize: 16),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'tables/coach_table.dart';
import 'tables/trainee_table.dart';

class AdminPage extends StatefulWidget {
  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    )..forward();
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Page'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Table(
            columnWidths: const <int, TableColumnWidth>{
              0: IntrinsicColumnWidth(),
              1: FlexColumnWidth(),
            },
            border: TableBorder.all(width: 1.0, color: Colors.grey.shade300),
            children: <TableRow>[
              _buildTableRow(
                context: context,
                widgetName: 'Coaches Table',
                color: Colors.grey.shade500,
                route: CoachTable(),
                index: 0,
              ),
              _buildTableRow(
                context: context,
                widgetName: 'Trainee Table',
                color: Colors.blue[400]!,
                route: TraineeTable(),
                index: 1,
              ),
              _buildTableRow(
                context: context,
                widgetName: 'checkout Table',
                color: Colors.grey.shade500,
                route: CoachTable(),
                index: 2,
              ),
              _buildTableRow(
                context: context,
                widgetName: 'checkout Table',
                color: Colors.blue[400]!,
                route: CoachTable(),
                index: 3,
              ),
              _buildTableRow(
                context: context,
                widgetName: 'Market Table',
                color: Colors.grey.shade500,
                route: MarketTable(),
                index: 4,
              ),
              _buildTableRow(
                context: context,
                widgetName: 'recipe Table',
                color: Colors.blue[400]!,
                route: RecipeTable(),
                index: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }

  TableRow _buildTableRow({
    required BuildContext context,
    required String widgetName,
    required Color color,
    required Widget route,
    required int index,
  }) {
    final bool isOddRow = _isOddRow(index);
    return TableRow(
      decoration: BoxDecoration(
        color: isOddRow ? Colors.grey.shade200 : Colors.white,
      ),
      children: <Widget>[
        FadeTransition(
          opacity: _animation,
          child: Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widgetName,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        FadeTransition(
          opacity: _animation,
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                Get.to(route);
              },
              style: ElevatedButton.styleFrom(
                primary: color,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Text(
                'View Table',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ),
      ],
    );
  }

  bool _isOddRow(int index) {
    return index.isOdd;
  }
}
