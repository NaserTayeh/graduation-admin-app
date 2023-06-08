import 'dart:io';

import 'package:flutter/material.dart';

class EditingPage extends StatefulWidget {
  const EditingPage({Key? key, required String email}) : super(key: key);

  @override
  _InputFormState createState() => _InputFormState();
}

class _InputFormState extends State<EditingPage> {
  final _formKey = GlobalKey<FormState>();
  String? _height;
  String? Password;
  String? _phone;
  String? _UserName;

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
                  "Edit Data",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                textAlign: TextAlign.center,
                decoration: const InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your Email';
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
                decoration: const InputDecoration(labelText: 'Phone Number'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your Phone Number';
                  }
                  return null;
                },
                onSaved: (value) => _phone = value,
              ),
              const SizedBox(
                height: 50,
              ),
              TextFormField(
                textAlign: TextAlign.center,
                decoration: const InputDecoration(labelText: 'User Name'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your User Name ';
                  }
                  return null;
                },
                onSaved: (value) => _UserName = value,
              ),
              const SizedBox(
                height: 50,
              ),
              TextFormField(
                textAlign: TextAlign.center,
                decoration: const InputDecoration(labelText: 'Password'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your Password';
                  }
                  return null;
                },
                onSaved: (value) => Password = value,
              ),
              const SizedBox(
                height: 50,
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Handle form submission
                  }
                },
                child: const Text('Update'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
