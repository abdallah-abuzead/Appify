class Workshop {
  int? id;
  String? logo;
  String? createdAt;
  String? updatedAt;
  String? name;
  String? address;
  String? geoLat;
  String? geoLng;
  double? starRating;
  String? priceRating;
  List<Services>? services;

  Workshop(
      {this.id,
      this.logo,
      this.createdAt,
      this.updatedAt,
      this.name,
      this.address,
      this.geoLat,
      this.geoLng,
      this.starRating,
      this.priceRating,
      this.services});

  Workshop.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    logo = json['logo'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    name = json['name'];
    address = json['address'];
    geoLat = json['geo_lat'];
    geoLng = json['geo_lng'];
    starRating = double.parse(json['star_rating'].toString());
    priceRating = json['price_rating'];
    if (json['services'] != null) {
      services = <Services>[];
      json['services'].forEach((v) {
        services!.add(Services.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['logo'] = logo;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['name'] = name;
    data['address'] = address;
    data['geo_lat'] = geoLat;
    data['geo_lng'] = geoLng;
    data['star_rating'] = starRating;
    data['price_rating'] = priceRating;
    if (services != null) {
      data['services'] = services!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Services {
  int? id;
  String? enName;
  String? arName;
  String? enDescription;
  String? arDescription;
  int? isActive;
  int? workShopId;
  int? requireCarBrand;
  String? serviceImage;
  WorkshopPivot? workshopPivot;

  Services({
    this.id,
    this.enName,
    this.arName,
    this.enDescription,
    this.arDescription,
    this.isActive,
    this.workShopId,
    this.requireCarBrand,
    this.serviceImage,
    this.workshopPivot,
  });

  Services.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    enName = json['en_name'];
    arName = json['ar_name'];
    enDescription = json['en_description'];
    arDescription = json['ar_description'];
    isActive = json['is_active'];
    workShopId = json['work_shop_id'];
    requireCarBrand = json['require_car_brand'];
    serviceImage = json['service_image'];
    workshopPivot = json['workshop_pivot'] != null ? WorkshopPivot.fromJson(json['workshop_pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['en_name'] = enName;
    data['ar_name'] = arName;
    data['en_description'] = enDescription;
    data['ar_description'] = arDescription;
    data['is_active'] = isActive;
    data['work_shop_id'] = workShopId;
    data['require_car_brand'] = requireCarBrand;
    data['service_image'] = serviceImage;
    if (workshopPivot != null) {
      data['workshop_pivot'] = workshopPivot!.toJson();
    }

    return data;
  }
}

class WorkshopPivot {
  int? workShopId;
  int? serviceId;
  int? price;
  int? astimatedTime;
  String? astimatedTimeType;
  String? requiredBrands;

  WorkshopPivot(
      {this.workShopId,
      this.serviceId,
      this.price,
      this.astimatedTime,
      this.astimatedTimeType,
      this.requiredBrands});

  WorkshopPivot.fromJson(Map<String, dynamic> json) {
    workShopId = json['work_shop_id'];
    serviceId = json['service_id'];
    price = json['price'];
    astimatedTime = json['astimated_time'];
    astimatedTimeType = json['astimated_time_type'];
    requiredBrands = json['required_brands'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['work_shop_id'] = workShopId;
    data['service_id'] = serviceId;
    data['price'] = price;
    data['astimated_time'] = astimatedTime;
    data['astimated_time_type'] = astimatedTimeType;
    data['required_brands'] = requiredBrands;
    return data;
  }
}
