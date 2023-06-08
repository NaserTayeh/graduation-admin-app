// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../../core/class/crud.dart';

class TestData {
  Crud crud;
  TestData({
    required this.crud,
  });
  getData(String linkUrl) async {
    try {
      var response = await crud.getData(linkUrl);
      return response.fold((l) => l, (r) => r);
    } on Exception catch (e) {
      print('here the exception catched');
      print(e);
    }
  }

  getRequestData(String linkUrl) async {
    var response = await crud.getRequestData(linkUrl);
    return response.fold((l) => l, (r) => r);
  }

  postData(String linkUrl, data) async {
    var response = await crud.postData(linkUrl, data);
    // print('zzzzzzzzzzzzzzzzzzzzzzz');
    // print(response);
    return response.fold((l) => l, (r) => r);
  }
}
