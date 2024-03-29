class GetDataApiResponse {
  GetDataApiResponse({
    this.data,
  });

  GetDataApiResponse.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }
  List<Data>? data;
}

class Data {
  Data({
    this.id,
    this.name,
    this.phone,
    this.address,
  });

  Data.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    phone = json['phone'];
    address = json['address'];
  }
  String? id;
  String? name;
  String? phone;
  String? address;
}
