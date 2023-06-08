import 'package:flutter/material.dart';
import 'EditCoach.dart';
import 'coachviewpage.dart';
import 'Adminboard.dart';
import 'SkillsList.dart';
import 'diabled_coach.dart';

class CoachesPage extends StatefulWidget {
  CoachesPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<CoachesPage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black);
  static List<Widget> _widgetOptions = <Widget>[
    coachviewpage(),
    DisabledCoachPage(),
    EditCoach(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black54,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.remove_from_queue_outlined),
            label: 'Pending Coaches',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.add),
          //   label: 'Add Coach',
          // ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.list),
          //   label: 'Skills',
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_4_rounded),
            label: 'Disabled Coaches',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_4_rounded),
            label: 'Active Coaches',
          ),
        ],
      ),
    );
  }
}
