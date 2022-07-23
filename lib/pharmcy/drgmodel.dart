class DrugDataModel {
  String? status;
  List<Alldrugs>? alldrugs;

  DrugDataModel({this.status, this.alldrugs});

  DrugDataModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['alldrugs'] != null) {
      alldrugs = <Alldrugs>[];
      json['alldrugs'].forEach((v) {
        alldrugs!.add(new Alldrugs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.alldrugs != null) {
      data['alldrugs'] = this.alldrugs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Alldrugs {
  String? sId;
  String? name;
  String? price;
  String? about;
  String? image;
  String? url;
  int? iV;

  Alldrugs(
      {this.sId,
      this.name,
      this.price,
      this.about,
      this.image,
      this.url,
      this.iV});

  Alldrugs.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    price = json['price'];
    about = json['about'];
    image = json['image'];
    url = json['url'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['price'] = this.price;
    data['about'] = this.about;
    data['image'] = this.image;
    data['url'] = this.url;
    data['__v'] = this.iV;
    return data;
  }
}
