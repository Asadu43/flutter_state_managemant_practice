import 'package:dio/dio.dart';
import 'package:flutter_state_managemant_practice/api_response/GetDataApiResponse.dart';

class GetDataApi {
  static Future<GetDataApiResponse> getRequest() async {
    try {
      final Dio dio = Dio();
      final Response response = await dio.get(
        "https://3ced-2407-aa80-116-cb91-4956-14f0-b8dc-65a8.ngrok-free.app/getData",
      );
      print(response.data);

      if (response.statusCode == 200) {
        return GetDataApiResponse.fromJson(response.data);
      } else {
        return GetDataApiResponse();
      }
    } catch (e) {
      return GetDataApiResponse.fromJson(e.toString());
    }
  }
}
