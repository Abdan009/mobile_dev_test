import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/api_return_value.dart';
import '../models/user_model.dart';
import 'providers.dart';

class UserProvider extends GetConnect {
  Future<ApiReturnValue> getUser(int id) async {
    timeout = Duration(seconds: maxResponseTime);
    try {
      Response response;

      String url ="$urlUsers/$id";

      response = await get(
        url,
      );

      debugPrint("URL api = $url");
      debugPrint("response api = ${response.body}");

      if (response.statusCode != 200) {
        String message = (response.body == null)
            ? "Terjadi kesalahan"
            : response.body['data']['message'];
        return ApiReturnValue(message: message);
      }
      var responseData = response.body;

      User result = User.fromJson(responseData);

      return ApiReturnValue(value: result);
    } catch (e) {
      debugPrint('Get User Error: ${e.toString()}');
      return ApiReturnValue(message: 'Error : ${e.toString()}');
    }
  }
}
