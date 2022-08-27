import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_mobile_dev/app/data/providers/providers.dart';

import '../../../utils/api_return_value.dart';
import '../models/feed_model.dart';

class FeedProvider extends GetConnect {
  Future<ApiReturnValue> getPosts() async {
    timeout = Duration(seconds: maxResponseTime);
    try {
      Response response;

      String url = urlPost;

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

      List<Feed> result = (responseData as List)
          .map(
            (e) => Feed.fromJson(e),
          )
          .toList();

      return ApiReturnValue(value: result);
    } catch (e) {
      debugPrint('Get Feeds Error: ${e.toString()}');
      return ApiReturnValue(message: 'Error : ${e.toString()}');
    }
  }

  Future<ApiReturnValue> addFeed(Feed feed) async {
    timeout = Duration(seconds: maxResponseTime);
    try {
      Response response;

      String url = urlPost;
      var data = feed.toJson();

      response = await post(
        url,
        data,
      );
      debugPrint("URL api = $url");
      debugPrint("response api = ${response.body}");
      var responseData = response.body;

      Feed result = Feed.fromJson(responseData);

      return ApiReturnValue(value: result);
    } catch (e) {
      debugPrint('Add Feed Error: ${e.toString()}');
      return ApiReturnValue(message: 'Error : ${e.toString()}');
    }
  }

  Future<ApiReturnValue> updateFeed(Feed feed) async {
    timeout = Duration(seconds: maxResponseTime);
    try {
      Response response;

      String url = "$urlPost/${feed.id}";
      var data = feed.toJson();

      response = await put(
        url,
        data,
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

      Feed result = Feed.fromJson(responseData);

      return ApiReturnValue(value: result);
    } catch (e) {
      debugPrint('Update Feed Error: ${e.toString()}');
      return ApiReturnValue(message: 'Error : ${e.toString()}');
    }
  }

  Future<ApiReturnValue> deleteFeed(Feed feed) async {
    timeout = Duration(seconds: maxResponseTime);
    try {
      Response response;

      String url = "$urlPost/${feed.id}";
      var data = FormData({
        'method':'DELETE'
      });

      response = await put(
        url,
        data,
      );
      debugPrint("URL api = $url");
      debugPrint("response api = ${response.body}");

      if (response.statusCode != 200) {
        String message = (response.body == null)
            ? "Terjadi kesalahan"
            : response.body['data']['message'];
        return ApiReturnValue(message: message);
      }

      return const ApiReturnValue(value: true);
    } catch (e) {
      debugPrint('Update Feed Error: ${e.toString()}');
      return ApiReturnValue(message: 'Error : ${e.toString()}');
    }
  }
}
