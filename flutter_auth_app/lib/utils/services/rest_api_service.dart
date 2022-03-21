import 'dart:convert';
import 'package:flutter_auth_app/config/environment-config.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class HttpServiceResponse {
  bool success;
  String message;
  dynamic result;

  HttpServiceResponse({this.success, this.message, this.result});

  HttpServiceResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    result = json['result'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    data['result'] = this.result;
    return data;
  }
}

class HttpService {
  String baseURL = EnvironmentConfig.apiPath;
  Map<String, String> constants = EnvironmentConfig.appConstant;

  Future<dynamic> get(String path) async {
    try {
      var header = await this.getHeader();
      String url = '$baseURL$path';
      var res = await http.get(url, headers: header);

      if (res.statusCode == 200) {
        return jsonDecode(res.body);
      } else {
        return null;
      }
    } catch (error) {
      return null;
    }
  }

  Future<dynamic> post(path, data) async {
    HttpServiceResponse response = new HttpServiceResponse();

    try {
      var header = await this.getHeader();
      var encodeData = jsonEncode(data);
      String url = '$baseURL$path';
      var res = await http.post(url, body: encodeData, headers: header);

      if (res.statusCode == 200) {
        response.success = true;
        response.message = '';
        response.result = '';

        var result = jsonDecode(res.body);
        return result;
      } else {
        response.success = false;
        response.message = "Error from get api";
        return response;
      }
    } catch (error) {
      response.success = false;
      response.message = "Error from get api";
      return response;
    }
  }

  Future<dynamic> auth(path, data) async {
    HttpServiceResponse response = new HttpServiceResponse();
    final storage = new FlutterSecureStorage();
    final options = IOSOptions(accessibility: IOSAccessibility.first_unlock);
    try {
      var header = {'Content-Type': 'application/json'};
      String token = await storage.read(key: constants['USER_TOKEN']);

      if (token != "") header['authorization'] = 'Bearer ' + token;

      var encodeData = jsonEncode(data);
      String url = '$baseURL$path';
      var res = await http.post(url, body: encodeData, headers: header);

      if (res.statusCode == 200) {
        response.success = true;
        response.message = '';
        var result = jsonDecode(res.body);
        await storage.write(
          key: constants['USER_TOKEN'],
          value: result['token'],
          iOptions: options,
        );

        response.success = true;
        return response;
      } else {
        response.success = false;
        response.message = "Error from get api";
        return response;
      }
    } catch (error) {
      response.success = false;
      response.message = "Error from get api";
      return response;
    }
  }

  Future<dynamic> getHeader() async {
    final storage = new FlutterSecureStorage();
    var header = {'Content-Type': 'application/json'};
    String token = await storage.read(key: constants['USER_TOKEN']);
    if (token != "") header['authorization'] = 'Bearer ' + token;
    return header;
  }
}
