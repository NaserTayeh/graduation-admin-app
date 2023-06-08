import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:admin_dashboard/models/coach_model.dart';
import 'package:admin_dashboard/models/trainee_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../constants/constants.dart';
import '../core/class/crud.dart';
import '../core/class/status_request.dart';
import '../data/remote/test_data.dart';
import '../linkapi.dart';
import '../models/analytic_info_model.dart';
import '../models/gym_model.dart';
import '../models/person_model.dart';

class GymProvider extends ChangeNotifier {
  TextEditingController? gymName = TextEditingController();
  TextEditingController? gymEmail = TextEditingController();
  TextEditingController? gymDesc = TextEditingController();
  TextEditingController? gymabout = TextEditingController();
  TextEditingController? gymLocation = TextEditingController();
  GlobalKey<FormState> editTraineeFormKey = GlobalKey();
  static PersonModel? loggedInAdmin;
  GymModel? gymModel;
  late Crud crud;
  late StatusRequest statusRequest;
  TestData? testData;
  File? selectedImg;
  GymProvider() {
    crud = Crud();
  }

  updateGymInfo() async {
    crud = Crud();
    testData = TestData(crud: crud);

    if (selectedImg != null) {
      log('with');
      crud = Crud();
      var data = {
        "Email": gymEmail!.text,
        "Name": gymName!.text,
        "gym_desc": gymDesc!.text,
        "Location": gymLocation!.text ?? '',
        "About": gymabout!.text,
      };

      var response = await crud.postRequestWithFile(
          AppLink.updateGymdata, data, selectedImg!);

      print(response);
    } else {
      log('without');
      var response2 = await testData!.postData(
          AppLink.updateinfo,
          jsonEncode({
            "Email": gymEmail!.text,
            "Name": gymName!.text,
            "gym_desc": gymDesc!.text,
            "Location": gymLocation!.text ?? '',
            "About": gymabout!.text,
          }));
      print(response2);
    }
  }

  getGymInfo() async {
    crud = Crud();
    testData = TestData(crud: crud);

    log('without');
    var response2 = await testData!.getData(
      AppLink.getAllGYMData,
    );
    gymModel = GymModel.fromJson(response2[0]);
    print(response2);
  }

  getImage(ImageSource source) async {
    XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);
    selectedImg = File(file!.path);
    // log(selectedImage!.path);
    notifyListeners();
  }

  requiredValidator(String? v) {
    log('in req validator');
    if (v!.isEmpty) {
      return "required field";
    }
  }

  setControllers({
    required String gymabout,
    required String gymDesc,
    required String gymEmail,
    required String gymName,
  }) {
    this.gymabout!.text = gymabout;
    this.gymDesc!.text = gymDesc;
    this.gymEmail!.text = gymEmail;
    this.gymName!.text = gymName;
    notifyListeners();
  }

  clearControllers() {
    gymabout!.text = "";
    gymDesc!.text = "";
    gymEmail!.text = "";
    gymName!.text = "";
    selectedImg = null;

    notifyListeners();
  }
}
