class AddDataApiResponse {
  AddDataApiResponse({
    this.result,
    this.body,
  });

  AddDataApiResponse.fromJson(dynamic json) {
    result = json['result'] != null ? Result.fromJson(json['result']) : null;
    body = json['body'] != null ? Body.fromJson(json['body']) : null;
  }
  Result? result;
  Body? body;
}

class Body {
  Body({
    this.name,
    this.phone,
    this.address,
    this.id,
  });

  Body.fromJson(dynamic json) {
    name = json['name'];
    phone = json['phone'];
    address = json['address'];
    id = json['_id'];
  }
  String? name;
  String? phone;
  String? address;
  String? id;
}

class Result {
  Result({
    this.acknowledged,
    this.insertedId,
  });

  Result.fromJson(dynamic json) {
    acknowledged = json['acknowledged'];
    insertedId = json['insertedId'];
  }
  bool? acknowledged;
  String? insertedId;
}
