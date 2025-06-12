import 'dart:convert';

import 'package:http/http.dart' as http;

abstract class NetworkServices {
  Future<dynamic> postCheckSuccess({required String link, required Map body});
  Future<dynamic> postGetData({required String link, required Map body});
}

class NetworkServicesImp extends NetworkServices {
  @override
  Future<dynamic> postCheckSuccess(
      {required String link, required Map body}) async {
    final response = await http.post(Uri.parse(link), body: body);

    try {
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        if (data["status"] == "success") {
          return RequestResult.success;
        } else if (data["status"] == "failure") {
          return RequestResult.failure;
        }
        return RequestResult.failure;
      } else {
        throw Exception(
            'API request failed with status code ${response.statusCode}');
      }
    } catch (e) {
      return RequestResult.exception;
    }
  }

  @override
  Future<dynamic> postGetData({required String link, required Map body}) async {
    final response = await http.post(Uri.parse(link), body: body);
    print(response.body);
    if (response.statusCode == 200) {
      Map responsebody = jsonDecode(response.body);
      print("-------------------------------------");
      print("data : $responsebody");
      if (responsebody['status'] == "success") {
        return responsebody['data'];
      } else {
        return {};
        // throw Exception('API request failed: {data[message]}');
      }
    } else {
      throw Exception(
          'API request failed with status code ${response.statusCode}');
    }
  }
}

enum RequestResult { success, failure, exception }
