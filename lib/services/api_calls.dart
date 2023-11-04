import 'dart:async';
import 'dart:convert';
import 'package:astrofuse_abhay/services/api_endpoints.dart';
import 'package:astrofuse_abhay/services/header.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class NetworkUtil {
  static Future<http.Response?> getApi(String endpointName,
      {required Map<String, String> headers, showLoader = false}) async {
    String url = ApiEndPoints.baseUrl + endpointName;

    var response;
    try {
      response = await http
          .get(Uri.parse(url), headers: headers)
          .timeout(const Duration(seconds: 30));
      if (response.statusCode == 403) {
      } else {
        return response;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  static Future<http.Response?> postApi(String endpointName, body,
      {required Map<String, String> headers}) async {
    String url = ApiEndPoints.baseUrl + endpointName;

    dynamic response;
    try {
      response = await http
          .post(Uri.parse(url), body: body, headers: headers)
          .timeout(const Duration(seconds: 30));
      if (response.statusCode == 403) {
      } else {
        return response;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  static Future<http.Response?> postCreateApi(
      BuildContext context, String endpointName,
      {required Map<String, String> headers,
      required Map<String, dynamic> body}) async {
    String url = ApiEndPoints.baseUrl + endpointName;
    print(body);
    print("$url --> ${jsonEncode(body)}");

    dynamic response;
    try {
      response = await http
          .post(Uri.parse(url), body: body, headers: headers)
          .timeout(const Duration(seconds: 30));
      if (response.statusCode == 403) {
      } else {
        return response;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  static Future<http.Response?> deleteApi(
      BuildContext context, String endpointName,
      {Map<String, String>? headers}) async {
    String url = ApiEndPoints.baseUrl + endpointName;
    print("$url --> ${jsonEncode(headers)}");
    dynamic response;
    try {
      response = await http
          .delete(Uri.parse(url), headers: headers)
          .timeout(const Duration(seconds: 30));
      if (response.statusCode == 403) {
      } else {
        return response;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  static Future<http.Response?> putApi(
      BuildContext context, String endpointName, body,
      {isAuthenticationRequired = true,
      showLoader = false,
      required Map<String, String> headers}) async {
    String url = ApiEndPoints.baseUrl + endpointName;
    print("$url --> ${jsonEncode(body)}");

    var response;
    try {
      response = await http
          .put(Uri.parse(url), body: jsonEncode(body), headers: headers)
          .timeout(const Duration(seconds: 30));
      if (response.statusCode == 403) {
      } else {
        return response;
      }

      print('Response [$url] --> ${response.body}');
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  static Future<http.Response?> patchApi(
      BuildContext context, String endpointName, Map<dynamic, dynamic> body,
      {isAuthenticationRequired = true,
      showLoader = false,
      required Map<String, String> headers}) async {
    String url = ApiEndPoints.baseUrl + endpointName;

    var response;

    try {
      response = await http
          .patch(Uri.parse(url),
              body: jsonEncode(body), headers: await getHeader())
          .timeout(const Duration(seconds: 30));
      if (response.statusCode == 403) {
      } else {
        return response;
      }

      print('Response [$url] --> ${response.body}');
    } catch (e) {
      print(e.toString());
    }
  }

  static Future<http.Response?> patchApiDio(
      BuildContext context, String endpointName, Map<dynamic, dynamic> hbody,
      {isAuthenticationRequired = true,
      showLoader = false,
      required Map<String, String> headers}) async {
    String url = ApiEndPoints.baseUrl + endpointName;

    var response;
    try {
      response = await Dio()
          .patch(url,
              data: hbody,
              options:
                  Options(headers: headers, contentType: 'application/json'))
          .timeout(const Duration(seconds: 30));
      if (response.statusCode == 403) {
      } else {
        return response;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  static Future<http.Response?> postApiDio(
      BuildContext context, String endpointName, Map<dynamic, dynamic> hbody,
      {isAuthenticationRequired = true,
      showLoader = false,
      required Map<String, String> headers}) async {
    String url = ApiEndPoints.baseUrl + endpointName;

    var response;
    try {
      response = await Dio()
          .post(url,
              data: hbody,
              options:
                  Options(headers: headers, contentType: 'application/json'))
          .timeout(const Duration(seconds: 30));
      if (response.statusCode == 403) {
      } else {
        return response;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
}
