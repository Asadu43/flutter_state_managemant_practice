import 'package:flutter/cupertino.dart';
import 'package:flutter_state_managemant_practice/services/add_data_api.dart';
import 'package:flutter_state_managemant_practice/services/get_data_api.dart';

import '../api_response/GetDataApiResponse.dart';

class DataProvider extends ChangeNotifier {
  List<Data> _data = [];
  List<Data> get data => _data;

  set data(List<Data> value) {
    _data = value;
    notifyListeners();
  }

  getData() async {
    final resp = await GetDataApi.getRequest();
    if (resp != null) {
      _data = resp.data!;
      notifyListeners();
    }
    return resp;
  }

  addData({required String name,required String phoneNumber,required String address}) async{
    final resp = await AddDataApi.addRequest(name: name, phoneNumber: phoneNumber, address: address);
    if (resp != null) {
      await getData();
    }
  }
}
