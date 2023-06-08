import 'dart:io';

import 'package:flutter/material.dart';
import 'SkillsAdd.dart';

class SkillList extends StatefulWidget {
  const SkillList({Key? key}) : super(key: key);

  @override
  _InputFormState createState() => _InputFormState();
}

class _InputFormState extends State<SkillList> {
  final _formKey = GlobalKey<FormState>();
  String _selectedSkills = '1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0.0,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Center(
                child: Text(
                  "Add a New List",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: 'Skills ID'),
                value: _selectedSkills,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedSkills = newValue!;
                  });
                },
                items: <String>['1', '2', '3']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              const SizedBox(
                height: 50,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SkillsAdd(),
                    ),
                  );
                },
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.green,
                  textStyle: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                  padding: const EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 24.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.add),
                    SizedBox(width: 5),
                    Text('Add a new list'),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: const Color.fromARGB(200, 252, 0, 0),
                  textStyle: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                  padding: const EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 24.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.delete),
                    SizedBox(width: 5),
                    Text('Delete this List'),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.blue,
                  textStyle: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                  padding: const EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 24.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.show_chart),
                    SizedBox(width: 5),
                    Text('Show List data'),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 110,
                        height: 5,
                        color: Colors.blue,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "9",
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "Powerlifting",
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 110,
                        height: 5,
                        color: Colors.blue,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "9",
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "Bodyweight",
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 100,
                        height: 5,
                        color: Colors.blue,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "9",
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      const Text(
                        "Cardiovascular",
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 110,
                        height: 5,
                        color: Colors.blue,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "9",
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "Yoga",
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 110,
                        height: 5,
                        color: Colors.blue,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "9",
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "Calisthenics",
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 110,
                        height: 5,
                        color: Colors.blue,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "9",
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "High_Intensity",
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 110,
                        height: 5,
                        color: Colors.blue,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "9",
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "Boxing",
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 110,
                        height: 5,
                        color: Colors.blue,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "9",
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "Bodybuilding",
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 110,
                        height: 5,
                        color: Colors.blue,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "9",
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "CrossFit",
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
