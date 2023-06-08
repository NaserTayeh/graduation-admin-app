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
import '../core/functions/handling_data_control.dart';
import '../data/remote/test_data.dart';
import '../linkapi.dart';
import '../models/analytic_info_model.dart';
import '../models/gym_model.dart';
import '../models/market_model.dart';
import '../models/person_model.dart';
import '../models/recipe_model.dart';

class AuthProvider extends ChangeNotifier {
  TextEditingController? adminName = TextEditingController();
  TextEditingController? adminEmail = TextEditingController();
  TextEditingController? adminPhone = TextEditingController();
  TextEditingController? adminPass = TextEditingController();
  GlobalKey<FormState> editTraineeFormKey = GlobalKey();
  static PersonModel? loggedInAdmin;
  late Crud crud;
  late StatusRequest statusRequest;
  TestData? testData;
  File? selectedImg;
  AuthProvider() {
    crud = Crud();
    getPersonsDate();
  }
  List<AnalyticInfo> analyticData = [
    AnalyticInfo(
      title: "Users",
      count: traineeCount,
      svgSrc: "assets/icons/Subscribers.svg",
      color: primaryColor,
    ),
    AnalyticInfo(
      title: "Trainer",
      count: coachCount,
      svgSrc: "assets/icons/triner.svg",
      color: purple,
    ),
    AnalyticInfo(
      title: "product",
      count: productCount,
      svgSrc: "assets/icons/energy.svg",
      color: orange,
    ),
    AnalyticInfo(
      title: "Profit",
      count: int.parse(allProfitFromCheckout.toString()) +
          int.parse(allProfitFromSubscrbtions.toString()),
      svgSrc: "assets/icons/money.svg",
      color: green,
    ),
  ];
  static int? traineeCount = 0;
  static int? coachCount = 0;
  static int? productCount = 0;

  List allTrainee = [];
  List notSubscribedTrainee = [];
  List allCoaches = [];
  List allPendingCoach = [];
  List allAcceptedCoach = [];
  List allDiabledCoach = [];
  List allRecipe = [];
  List allSupplement = [];
  List personsDate = [];
  List checkoutProfits = [];
  List subscribtionsProfit = [];
  List allCheckoutsData = [];
  static num? allProfitFromCheckout = 0;
  static num? allProfitFromSubscrbtions = 0;

  GymModel? gymModel;

  getCheckoutProfits() async {
    crud = Crud();
    testData = TestData(crud: crud);
    var response = await testData!.getData(
      AppLink.getCheckoutProfit,
    );
    print(response);
    if (response.length > 0) {
      checkoutProfits = response;
      checkoutProfits.forEach((element) {
        allProfitFromCheckout = allProfitFromCheckout! + element['total_price'];
      });
      analyticData[3].count = (analyticData[3].count! +
          int.parse(allProfitFromCheckout.toString()));
      print(allProfitFromCheckout);
    }
    notifyListeners();
  }

  getAllCheckoutsData() async {
    crud = Crud();
    testData = TestData(crud: crud);
    var response = await testData!.getData(
      AppLink.getAllCheckouts,
    );
    print(response);
    if (response.length > 0) {
      allCheckoutsData = response;
    }
    notifyListeners();
  }

  updateLocation(String long, String latit) async {
    crud = Crud();
    testData = TestData(crud: crud);
    var response = await testData!.postData(AppLink.updateLocation,
        jsonEncode({"longitude": long, "latitude": latit}));
    print(response);
  }

  getsubscribtionsProfit() async {
    crud = Crud();
    testData = TestData(crud: crud);
    var response = await testData!.getData(
      AppLink.getSubscribtionProfit,
    );
    print(response);
    if (response.length > 0) {
      subscribtionsProfit = response;
      subscribtionsProfit.forEach((element) {
        allProfitFromSubscrbtions =
            allProfitFromSubscrbtions! + element['price'];
      });
      analyticData[3].count = (analyticData[3].count! +
          int.parse(allProfitFromSubscrbtions.toString()));
      print(allProfitFromSubscrbtions);
    }
    notifyListeners();
  }

  getNotSubscribedTrainee() async {
    notSubscribedTrainee =
        allTrainee.where((element) => element.isPrem == 0).toList();
    notifyListeners();
  }

  getAcceptedCoaches() async {
    crud = Crud();
    testData = TestData(crud: crud);
    var response = await testData!.getData(
      AppLink.getAllAcceptedRequest,
    );
    print(response);
    if (response.length > 0) {
      allAcceptedCoach = response.map((e) => CoachModel.fromJson(e)).toList();
    } else {
      allAcceptedCoach = [];
    }
    notifyListeners();
  }

  getPersonsDate() async {
    print('in get person dataaaaaaaa');
    crud = Crud();
    testData = TestData(crud: crud);
    var response = await testData!.getData(
      AppLink.getPersonsDate,
    );
    print(response);
    if (response.length > 0) {
      personsDate = response;
      // allAcceptedCoach = response.map((e) => CoachModel.fromJson(e)).toList();
    }
    print('----------------------------------------------');
    print(personsDate.length);
    notifyListeners();
  }

  getAllRecipe() async {
    statusRequest = StatusRequest.loading;
    var respose = await testData!.getData(AppLink.getAllRecipe);
    statusRequest = handlingData(respose);
    if (StatusRequest.success == statusRequest) {
      allRecipe = respose.map((e) => RecipeModel.fromJson(e)).toList();
      print(respose);
    }
    notifyListeners();
    return respose;
  }

  getAllMarketItems() async {
    print('ingetAllMarketItems');
    testData = TestData(crud: crud);
    List res = [];
    var respose;
    statusRequest = StatusRequest.loading;
    respose = await testData!.getRequestData(
      AppLink.getAllMarketItems,
    );
    statusRequest = handlingData(respose);
    if (StatusRequest.success == statusRequest) {
      allSupplement = respose.map((e) => MarketModel.fromJson(e)).toList();
      productCount = allSupplement.length;

      analyticData[2].count = productCount;
      print('^' * 10);
      print(analyticData[2].count);
      print('^' * 10);

      notifyListeners();
    }
  }

  deleteCoach(CoachModel coachModel) async {
    crud = Crud();
    testData = TestData(crud: crud);
    var response = await testData!.postData(
        AppLink.deleteRequest, jsonEncode({"Coach_id": coachModel.coachId}));
    print('i' * 10);
    print(response);
    print('i' * 10);

    await getAcceptedCoaches();
    await getPendingCoaches();
    await getDiabledCoaches();
    notifyListeners();
  }

  diabledCoach(CoachModel coachModel) async {
    crud = Crud();
    testData = TestData(crud: crud);
    var response = await testData!.postData(
        AppLink.unEnablRequest, jsonEncode({"Coach_id": coachModel.coachId}));
    print('i' * 10);
    print(response);
    print('i' * 10);

    await getAcceptedCoaches();
    await getPendingCoaches();
    await getDiabledCoaches();
    notifyListeners();
  }

  unPendCoach(CoachModel coachModel) async {
    crud = Crud();
    testData = TestData(crud: crud);
    var response = await testData!.postData(
        AppLink.unPendRequest, jsonEncode({"Coach_id": coachModel.coachId}));
    print('i' * 10);
    print(response);
    print('i' * 10);

    await getAcceptedCoaches();
    await getPendingCoaches();
    await getDiabledCoaches();
    notifyListeners();
  }

  enabledCoach(CoachModel coachModel) async {
    crud = Crud();
    testData = TestData(crud: crud);
    var response = await testData!.postData(
        AppLink.enablRequest, jsonEncode({"Coach_id": coachModel.coachId}));
    print('i' * 10);
    print(response);
    print('i' * 10);

    await getAcceptedCoaches();
    await getPendingCoaches();
    await getDiabledCoaches();
    notifyListeners();
  }

  getPendingCoaches() async {
    crud = Crud();
    testData = TestData(crud: crud);
    var response = await testData!.getData(
      AppLink.getAllPendingRequest,
    );
    print(response);
    if (response.length > 0) {
      allPendingCoach = response.map((e) => CoachModel.fromJson(e)).toList();
    } else {
      allPendingCoach = [];
    }
    notifyListeners();
  }

  getDiabledCoaches() async {
    crud = Crud();
    testData = TestData(crud: crud);
    var response = await testData!.getData(
      AppLink.getAllDisaledRequest,
    );
    print(response);
    if (response.length > 0) {
      allDiabledCoach = response.map((e) => CoachModel.fromJson(e)).toList();
    } else {
      allDiabledCoach = [];
    }
    notifyListeners();
  }

  getTraineeCount() async {
    crud = Crud();
    testData = TestData(crud: crud);
    var response = await testData!.getData(
      AppLink.countTrainee,
    );
    print('here is 888');
    print(response);
    traineeCount = response['count'];
    analyticData[1].count = traineeCount;
    notifyListeners();
  }

  getAllTrainee() async {
    crud = Crud();
    testData = TestData(crud: crud);
    var response = await testData!.getData(
      AppLink.getAllTrainee,
    );
    allTrainee = response.map((e) => TraineeModel.fromJson(e)).toList();
    getNotSubscribedTrainee();
    print(response);
    notifyListeners();
  }

  getCoachCount() async {
    crud = Crud();
    testData = TestData(crud: crud);
    var response = await testData!.getData(
      AppLink.countCoach,
    );
    print(response);
    coachCount = response['count'];
    analyticData[0].count = traineeCount! + coachCount!;
    notifyListeners();
  }

  getAllCoach() async {
    crud = Crud();
    testData = TestData(crud: crud);
    var response = await testData!.getData(
      AppLink.getAllCoaches,
    );
    print(response);
    if (response.length > 0)
      allCoaches = response.map((e) => CoachModel.fromJson(e)).toList();
    else {
      allCoaches = [];
    }
    notifyListeners();
  }

  setTraineeImg(File file) {
    selectedImg = file;
    notifyListeners();
  }

  getAllGymData() async {
    crud = Crud();
    testData = TestData(crud: crud);
    var response = await testData!.getData(
      AppLink.getAllGYMData,
    );
    print(response);
    gymModel = GymModel.fromJson(response[0]);

    notifyListeners();
  }

  updateAdminInfo({PersonModel? personModel}) async {
    crud = Crud();
    testData = TestData(crud: crud);
    log(adminEmail!.text);
    if (selectedImg != null) {
      log('with');
      crud = Crud();
      var data = {
        "Email": adminEmail!.text,
      };

      var response = await crud.postRequestWithFile(
          AppLink.addAdminPhoto, data, selectedImg!);
      response = await testData!.postData(
          AppLink.updateinfo,
          jsonEncode({
            "person_id": 0,
            "Password": adminPass!.text,
            "Email": adminEmail!.text,
            "phone_number": adminPhone!.text,
            "User_Name": adminName!.text,
          }));
      print(response);
    } else {
      log('without');
      var response2 = await testData!.postData(
          AppLink.updateinfo,
          jsonEncode({
            "person_id": 0,
            "Password": adminPass!.text,
            "Email": adminEmail!.text,
            "phone_number": adminPhone!.text,
            "User_Name": adminName!.text,
          }));
      print(response2);
    }
  }

  getAdminInfo() async {
    crud = Crud();
    testData = TestData(crud: crud);
    log(adminEmail!.text);

    log('without');
    var response2 = await testData!.postData(
        AppLink.getdataadmin,
        jsonEncode({
          "email": 'admin@gmail.com',
        }));
    loggedInAdmin = PersonModel.fromJson(response2[0]);
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
    required String adminName,
    required String adminEmail,
    required String adminPass,
    required String adminPhone,
  }) {
    this.adminName!.text = adminName;
    this.adminEmail!.text = adminEmail;
    this.adminPass!.text = adminPass;
    this.adminPhone!.text = adminPhone;
    notifyListeners();
  }

  clearControllers() {
    adminName!.text = "";
    adminEmail!.text = "";
    adminPass!.text = "";
    adminPhone!.text = "";
    selectedImg = null;

    notifyListeners();
  }
}
