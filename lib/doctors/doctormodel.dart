import 'dart:convert';

class DoctorModel {
  String? status;
  int? count;
  List<AllDoc>? allDoc;

  DoctorModel({this.status, this.count, this.allDoc});

  DoctorModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    count = json['count'];
    if (json['allDoc'] != null) {
      allDoc = <AllDoc>[];
      json['allDoc'].forEach((v) {
        allDoc!.add(new AllDoc.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['count'] = this.count;
    if (this.allDoc != null) {
      data['allDoc'] = this.allDoc!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AllDoc {
  Avatar? avatar;
  String? sId;
  String? name;
  String? email;
  String? password;
  String? phone;
  String? address;
  String? price;
  String? specialize;
  String? about;
  List<String>? patient;
  int? iV;

  AllDoc(
      {this.avatar,
      this.sId,
      this.name,
      this.email,
      this.password,
      this.phone,
      this.address,
      this.price,
      this.specialize,
      this.about,
      this.patient,
      this.iV});

  AllDoc.fromJson(Map<String, dynamic> json) {
    avatar =
        json['avatar'] != null ? new Avatar.fromJson(json['avatar']) : null;
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    phone = json['phone'];
    address = json['address'];
    price = json['price'];
    specialize = json['specialize'];
    about = json['about'];
    patient = json['patient'].cast<String>();
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.avatar != null) {
      data['avatar'] = this.avatar!.toJson();
    }
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['price'] = this.price;
    data['specialize'] = this.specialize;
    data['about'] = this.about;
    data['patient'] = this.patient;
    data['__v'] = this.iV;
    return data;
  }
}

class Avatar {
  String? publicId;
  String? url;

  Avatar({this.publicId, this.url});

  Avatar.fromJson(Map<String, dynamic> json) {
    publicId = json['public_id'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['public_id'] = this.publicId;
    data['url'] = this.url;
    return data;
  }
}
