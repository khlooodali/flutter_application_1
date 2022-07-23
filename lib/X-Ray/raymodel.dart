class RayModel {
  List<Rays>? rays;

  RayModel({this.rays});

  RayModel.fromJson(Map<String, dynamic> json) {
    if (json['rays'] != null) {
      rays = <Rays>[];
      json['rays'].forEach((v) {
        rays!.add(new Rays.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.rays != null) {
      data['rays'] = this.rays!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Rays {
  String? sId;
  String? photo;
  String? name;
  String? government;
  String? location;
  String? phone;
  String? city;
  String? longitude;
  String? latitude;
  String? website;
  String? url;
  String? appoinment;
  int? iV;

  Rays(
      {this.sId,
      this.photo,
      this.name,
      this.government,
      this.location,
      this.phone,
      this.city,
      this.longitude,
      this.latitude,
      this.website,
      this.url,
      this.appoinment,
      this.iV});

  Rays.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    photo = json['photo'];
    name = json['name'];
    government = json['government'];
    location = json['location'];
    phone = json['phone'];
    city = json['city'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    website = json['website'];
    url = json['url'];
    appoinment = json['appoinment'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['photo'] = this.photo;
    data['name'] = this.name;
    data['government'] = this.government;
    data['location'] = this.location;
    data['phone'] = this.phone;
    data['city'] = this.city;
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    data['website'] = this.website;
    data['url'] = this.url;
    data['appoinment'] = this.appoinment;
    data['__v'] = this.iV;
    return data;
  }
}
