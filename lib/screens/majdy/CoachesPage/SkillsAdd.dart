import 'package:flutter/material.dart';

class SkillsAdd extends StatefulWidget {
  @override
  _ScrollbarInputState createState() => _ScrollbarInputState();
}

class _ScrollbarInputState extends State<SkillsAdd> {
  double _powerliftingValue = 5;
  double _bodyweightValue = 5;
  double _cardiovascularValue = 5;
  double _yogaValue = 5;
  double _calisthenicsValue = 5;
  double _highIntensityValue = 5;
  double _boxingValue = 5;
  double _bodybuildingValue = 5;
  double _crossfitValue = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20.0),
            Container(
              margin: EdgeInsets.all(10),
              child: Text(
                'Edit Skills for the Coach ',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w300),
              ),
            ),
            SizedBox(height: 20.0),
            ListTile(
              title: Text('Powerlifting'),
              trailing: Text(_powerliftingValue.toInt().toString()),
            ),
            Scrollbar(
              child: Slider(
                value: _powerliftingValue,
                min: 0,
                max: 10,
                divisions: 10,
                onChanged: (double value) {
                  setState(() {
                    _powerliftingValue = value;
                  });
                },
              ),
            ),
            ListTile(
              title: Text('Bodyweight'),
              trailing: Text(_bodyweightValue.toInt().toString()),
            ),
            Scrollbar(
              child: Slider(
                value: _bodyweightValue,
                min: 0,
                max: 10,
                divisions: 10,
                onChanged: (double value) {
                  setState(() {
                    _bodyweightValue = value;
                  });
                },
              ),
            ),
            ListTile(
              title: Text('Cardiovascular'),
              trailing: Text(_cardiovascularValue.toInt().toString()),
            ),
            Scrollbar(
              child: Slider(
                value: _cardiovascularValue,
                min: 0,
                max: 10,
                divisions: 10,
                onChanged: (double value) {
                  setState(() {
                    _cardiovascularValue = value;
                  });
                },
              ),
            ),
            ListTile(
              title: Text('Yoga'),
              trailing: Text(_yogaValue.toInt().toString()),
            ),
            Scrollbar(
              child: Slider(
                value: _yogaValue,
                min: 0,
                max: 10,
                divisions: 10,
                onChanged: (double value) {
                  setState(() {
                    _yogaValue = value;
                  });
                },
              ),
            ),
            ListTile(
              title: Text('Calisthenics'),
              trailing: Text(_calisthenicsValue.toInt().toString()),
            ),
            Scrollbar(
              child: Slider(
                value: _calisthenicsValue,
                min: 0,
                max: 10,
                divisions: 10,
                onChanged: (double value) {
                  setState(() {
                    _calisthenicsValue = value;
                  });
                },
              ),
            ),
            ListTile(
              title: Text('High Intensity'),
              trailing: Text(_highIntensityValue.toInt().toString()),
            ),
            Scrollbar(
              child: Slider(
                value: _highIntensityValue,
                min: 0,
                max: 10,
                divisions: 10,
                onChanged: (double value) {
                  setState(() {
                    _highIntensityValue = value;
                  });
                },
              ),
            ),
            ListTile(
              title: Text('Boxing'),
              trailing: Text(_boxingValue.toInt().toString()),
            ),
            Scrollbar(
              child: Slider(
                value: _boxingValue,
                min: 0,
                max: 10,
                divisions: 10,
                onChanged: (double value) {
                  setState(() {
                    _boxingValue = value;
                  });
                },
              ),
            ),
            ListTile(
              title: Text('Bodybuilding'),
              trailing: Text(_bodybuildingValue.toInt().toString()),
            ),
            Scrollbar(
              child: Slider(
                value: _bodybuildingValue,
                min: 0,
                max: 10,
                divisions: 10,
                onChanged: (double value) {
                  setState(() {
                    _bodybuildingValue = value;
                  });
                },
              ),
            ),
            ListTile(
              title: Text('CrossFit'),
              trailing: Text(_crossfitValue.toInt().toString()),
            ),
            Scrollbar(
              child: Slider(
                value: _crossfitValue,
                min: 0,
                max: 10,
                divisions: 10,
                onChanged: (double value) {
                  setState(() {
                    _crossfitValue = value;
                  });
                },
              ),
            ),
            SizedBox(height: 20.0),
            TextButton(
              onPressed: () {
                // TODO: do something with the values
                print('Powerlifting: ${_powerliftingValue.toInt()}');
                print('Bodyweight: ${_bodyweightValue.toInt()}');
                print('Cardiovascular: ${_cardiovascularValue.toInt()}');
                print('Yoga: ${_yogaValue.toInt()}');
                print('Calisthenics: ${_calisthenicsValue.toInt()}');
                print('High Intensity: ${_highIntensityValue.toInt()}');
                print('Boxing: ${_boxingValue.toInt()}');
                print('Bodybuilding: ${_bodybuildingValue.toInt()}');
                print('CrossFit: ${_crossfitValue.toInt()}');
              },
              child: Text('Submit'),
            ),
            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
