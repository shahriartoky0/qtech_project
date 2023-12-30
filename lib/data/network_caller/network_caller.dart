import 'dart:convert';
import 'package:http/http.dart' as http;
import 'network_response.dart';

class NetworkCaller {
  Future<NetworkResponse> postRequest(String url,
      {Map<String, dynamic>? body}) async {
    try {
      final http.Response response = await http.post(
        Uri.parse(url),
        body: jsonEncode(body),
        headers: {
          'content-type': 'application/json',
        },
      );

      return _handleResponse(response);
    } catch (e) {
      return NetworkResponse(isSuccess: false, errorMessage: e.toString());
    }
  }

  Future<NetworkResponse> getRequest(String url,
      {Map<String, dynamic>? body}) async {
    try {
      final http.Response response = await http.get(
        Uri.parse(url),
        headers: {
          'content-Type': 'application/json; charset=UTF-8',
        },
      );

      return _handleResponse(response);
    } catch (e) {
      return NetworkResponse(isSuccess: false, errorMessage: e.toString());
    }
  }

  NetworkResponse _handleResponse(http.Response response) {
    String responseBody = utf8.decode(response.bodyBytes);

    final int statusCode = response.statusCode;
    final Map<String, dynamic> jsonResponse = jsonDecode(responseBody);

    if (statusCode == 200) {
      return NetworkResponse(
          isSuccess: true, jsonResponse: jsonResponse, statusCode: 200);
    } else if (statusCode == 401) {
      return NetworkResponse(
          isSuccess: false, statusCode: statusCode, jsonResponse: jsonResponse);
    } else {
      return NetworkResponse(
          isSuccess: false,
          errorMessage: 'Unexpected status code: $statusCode');
    }
  }
}
