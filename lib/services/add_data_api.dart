import 'package:dio/dio.dart';
import 'package:flutter_state_managemant_practice/api_response/AddDataApiResponse.dart';

class AddDataApi {
  static Future<AddDataApiResponse> addRequest(
      {required String name,
      required String phoneNumber,
      required String address}) async {
    try {
      final Dio dio = Dio();
      final Response response = await dio.post(
          "https://3ced-2407-aa80-116-cb91-4956-14f0-b8dc-65a8.ngrok-free.app/addData",
          data: {"name": name, "phone": phoneNumber, "address": address});
      if (response.statusCode == 200) {
        return AddDataApiResponse.fromJson(response.data);
      } else {
        return AddDataApiResponse();
      }
    } catch (e) {
      return AddDataApiResponse.fromJson(e.toString());
    }
  }
}
