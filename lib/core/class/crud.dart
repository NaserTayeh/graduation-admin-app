import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:admin_dashboard/core/class/status_request.dart';
import 'package:dartz/dartz.dart';
import 'package:path/path.dart';
import '../functions/checkinternet.dart';
import 'package:http/http.dart' as http;

class Crud {
  Future<Either<StatusRequest, dynamic>> getData(String linkurl) async {
    try {
      if (await checkInternet()) {
        log(Uri.parse(linkurl).toString());

        var response = await http.post(Uri.parse(linkurl));
        log('here');
        print('--------------------------------');
        print(response.body);
        print('--------------------------------');

        if (response.statusCode == 200 || response.statusCode == 201) {
          var responsebody = jsonDecode(response.body);
          return Right(responsebody);
        } else {
          return const Left(StatusRequest.serverfailure);
        }
      } else {
        return const Left(StatusRequest.offlinefailure);
      }
    } on Exception catch (e) {
      print('excerptoon occur');
      print(e);
      return const Left(StatusRequest.serverfailure);
    }
  }

  Future<Either<StatusRequest, List>> getRequestData(String linkurl) async {
    try {
      if (await checkInternet()) {
        var response = await http.get(Uri.parse(linkurl));
        print(response.body);
        if (response.statusCode == 200 || response.statusCode == 201) {
          List responsebody = jsonDecode(response.body);

          return Right(responsebody);
        } else {
          return const Left(StatusRequest.serverfailure);
        }
      } else {
        return const Left(StatusRequest.offlinefailure);
      }
    } on Exception catch (e) {
      print(e);
      return const Left(StatusRequest.serverfailure);
    }
  }

  Future<Either<StatusRequest, dynamic>> postData(String linkurl, data) async {
    try {
      // print(data.toString() + "data in crud");
      log('heree');
      if (await checkInternet()) {
        log('here');
        // log(Uri.parse(linkurl).toString());
        var response =
            await http.post(Uri.parse(linkurl), body: data, headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
        });
        print('body ------------');
        print(response.body);
        // log('here');
        // print(response.body);
        if (response.statusCode == 200 || response.statusCode == 201) {
          // print(response.body);
          dynamic responsebody = jsonDecode(response.body);
          return Right(responsebody);
        } else {
          return const Left(StatusRequest.serverfailure);
        }
      } else {
        log('internet connection lose');
        return const Left(StatusRequest.offlinefailure);
      }
    } on Exception catch (e) {
      print(e);
      return const Left(StatusRequest.serverfailure);
    }
  }

  postRequestWithFile(String url, Map data, File file) async {
    try {
      print(url);
      print(data);
      print(file.path);
      var request = http.MultipartRequest("POST", Uri.parse(url));
      var length = await file.length();
      var stream = http.ByteStream(file.openRead());
      // to deal with pic
      var multipartFile = http.MultipartFile("photo", stream, length,
          filename: basename(file.path));
      request.files.add(multipartFile);
      // additional if we need to add additional info
      data.forEach((key, value) {
        request.fields[key] = value.toString();
      });

      var myRequest = await request.send();
      // to get the response of the request
      var response = await http.Response.fromStream(myRequest);

      if (myRequest.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        print('error${myRequest.statusCode}');
      }
    } on Exception catch (e) {
      // TODO
      log(e.toString());
      return "failed to add from flutter";
    }
  }
}
