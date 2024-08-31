import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_getx_mvvm_masterclass/data/app_exceptions.dart';
import 'package:flutter_getx_mvvm_masterclass/data/network/BaseApiService.dart';
import 'package:http/http.dart';

class NetworkApiService extends BaseApiService {
  @override
  Future getApi(String url) async {
    if (kDebugMode) {
      print(url);
    }
    dynamic responseJson;

    try {
      final response =
          await get(Uri.parse(url)).timeout(const Duration(seconds: 10));

      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException('');
    } on RequestTimeOut {
      throw RequestTimeOut('');
    }

    return responseJson;
  }

  @override
  Future postApi(var data, String url) async {
    if (kDebugMode) {
      print(url);
    }
    dynamic responseJson;

    try {
      final response = await post(Uri.parse(url),
              // body: jsonEncode(data) //for row data
              body: data)
          .timeout(const Duration(seconds: 10));

      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException('');
    } on RequestTimeOut {
      throw RequestTimeOut('');
    }

    return responseJson;
  }

  dynamic returnResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        return jsonDecode(response.body);
      case 400:
        throw InvalidUrlException;
      default:
        throw FetchDataException(
            'Error occurred while communication with server');
    }
  }
}
