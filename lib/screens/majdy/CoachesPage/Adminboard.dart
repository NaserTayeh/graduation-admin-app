import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class InputForm extends StatefulWidget {
  const InputForm({Key? key}) : super(key: key);

  @override
  _InputFormState createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  final _formKey = GlobalKey<FormState>();
  String? _height;
  String? _weight;
  String? _yearOfExp;
  String? _age;
  String? _coachingFocus;
  String? _gender;
  String? _fullName;
  String? _personalPic;
  String? _qualifications;
  String? _nationality;
  String? _skillsId;
  String? _services;
  String? _subscriptionTax;
  String? _salary;
  String? _language;

  String _selectedNationality = 'American';
  String _selectedGender = 'Male';
  String _selectedLanguage = 'Arabic';
  String _selectedSkills = '1';

  File? _image;

  Future<void> _getImage(ImageSource source) async {
    final pickedFile = await ImagePicker().getImage(source: source);

    setState(() {
      _image = File(pickedFile!.path);
    });
  }

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
                  "Add a New Coach",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: Center(
                  child: _image == null
                      ? const Text('No image selected.')
                      : Image.file(_image!),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return SafeArea(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ListTile(
                              leading: const Icon(Icons.photo_camera),
                              title: const Text('Take a picture'),
                              onTap: () {
                                _getImage(ImageSource.camera);
                                Navigator.pop(context);
                              },
                            ),
                            ListTile(
                              leading: const Icon(Icons.photo_library),
                              title: const Text('Choose from gallery'),
                              onTap: () {
                                _getImage(ImageSource.gallery);
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                child: const Icon(Icons.add_a_photo),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                textAlign: TextAlign.center,
                decoration: const InputDecoration(labelText: 'Height'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your height';
                  }
                  return null;
                },
                onSaved: (value) => _height = value,
              ),
              const SizedBox(
                height: 50,
              ),
              TextFormField(
                textAlign: TextAlign.center,
                decoration: const InputDecoration(labelText: 'Weight'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your weight';
                  }
                  return null;
                },
                onSaved: (value) => _weight = value,
              ),
              const SizedBox(
                height: 50,
              ),
              TextFormField(
                textAlign: TextAlign.center,
                decoration:
                    const InputDecoration(labelText: 'Year of experience'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your year of experience';
                  }
                  return null;
                },
                onSaved: (value) => _yearOfExp = value,
              ),
              const SizedBox(
                height: 50,
              ),
              TextFormField(
                textAlign: TextAlign.center,
                decoration: const InputDecoration(labelText: 'Age'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your age';
                  }
                  return null;
                },
                onSaved: (value) => _age = value,
              ),
              const SizedBox(
                height: 50,
              ),
              TextFormField(
                textAlign: TextAlign.center,
                decoration: const InputDecoration(labelText: 'Coaching Focus'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your coaching focus';
                  }
                  return null;
                },
                onSaved: (value) => _coachingFocus = value,
              ),
              const SizedBox(
                height: 50,
              ),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: 'Gender'),
                value: _selectedGender,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedGender = newValue!;
                    _gender = _selectedGender;
                  });
                },
                items: <String>['Male', 'Female', 'Other']
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
              TextFormField(
                textAlign: TextAlign.center,
                decoration: const InputDecoration(labelText: 'Full Name'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your full name';
                  }
                  return null;
                },
                onSaved: (value) => _fullName = value,
              ),
              const SizedBox(
                height: 50,
              ),
              TextFormField(
                textAlign: TextAlign.center,
                decoration: const InputDecoration(labelText: 'Qualifications'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your qualifications';
                  }
                  return null;
                },
                onSaved: (value) => _qualifications = value,
              ),
              const SizedBox(
                height: 50,
              ),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: 'Nationality'),
                value: _selectedNationality,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedNationality = newValue!;
                    _nationality = _selectedNationality;
                  });
                },
                items: <String>['American', 'British', 'Canadian', 'Italian']
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
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: 'Skills ID'),
                value: _selectedSkills,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedSkills = newValue!;
                    _skillsId = _selectedSkills;
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
              TextFormField(
                textAlign: TextAlign.center,
                decoration: const InputDecoration(labelText: 'Services'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your services';
                  }
                  return null;
                },
                onSaved: (value) => _services = value,
              ),
              const SizedBox(
                height: 50,
              ),
              TextFormField(
                textAlign: TextAlign.center,
                decoration:
                    const InputDecoration(labelText: 'Subscription Tax'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your subscription tax';
                  }
                  return null;
                },
                onSaved: (value) => _subscriptionTax = value,
              ),
              const SizedBox(
                height: 50,
              ),
              TextFormField(
                textAlign: TextAlign.center,
                decoration: const InputDecoration(labelText: 'Salary'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your salary';
                  }
                  return null;
                },
                onSaved: (value) => _salary = value,
              ),
              const SizedBox(
                height: 50,
              ),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: 'Language'),
                value: _selectedLanguage,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedLanguage = newValue!;
                    _language = _selectedLanguage;
                  });
                },
                items: <String>['Arabic', 'English', 'Italian']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Handle form submission
                  }
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
