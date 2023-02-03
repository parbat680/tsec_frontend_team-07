class Apartment {
  Address? address;
  String? sId;
  String? phone;
  String? gender;
  String? rent;
  List<String>? images;
  int? iV;
  int? area;
  int? bhk;

  Apartment(
      {this.address,
      this.sId,
      this.phone,
      this.gender,
      this.rent,
      this.images,
      this.area,
      this.bhk,
      this.iV});

  Apartment.fromJson(Map<String, dynamic> json) {
    address =
        json['address'] != null ? new Address.fromJson(json['address']) : null;
    sId = json['_id'];
    phone = json['phone'];
    gender = json['gender'];
    rent = json['rent'];
    images = json['images'].cast<String>();
    area = json['area'] ?? 0;
    bhk = json['bhk'] ?? 0;
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    data['_id'] = this.sId;
    data['phone'] = this.phone;
    data['gender'] = this.gender;
    data['rent'] = this.rent;
    data['images'] = this.images;
    data['__v'] = this.iV;
    return data;
  }
}

class Address {
  String? addressLine1;
  String? addressLine2;
  String? city;
  String? state;
  String? pincode;

  Address(
      {this.addressLine1,
      this.addressLine2,
      this.city,
      this.state,
      this.pincode});

  Address.fromJson(Map<String, dynamic> json) {
    addressLine1 = json['addressLine1'];
    addressLine2 = json['addressLine2'];
    city = json['city'];
    state = json['state'];
    pincode = json['pincode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['addressLine1'] = this.addressLine1;
    data['addressLine2'] = this.addressLine2;
    data['city'] = this.city;
    data['state'] = this.state;
    data['pincode'] = this.pincode;
    return data;
  }
}
