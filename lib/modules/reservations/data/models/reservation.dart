class Reservation {
  int? id;
  int? orderNumber;
  String? createdAt;
  String? updatedAt;
  int? totalPrice;
  String? type;
  String? reservationDate;
  int? clientId;
  List<Services>? services;
  String? status;
  String? statusAr;
  String? car;
  ReservationWorkshop? workshop;

  Reservation(
      {this.id,
      this.orderNumber,
      this.createdAt,
      this.updatedAt,
      this.totalPrice,
      this.type,
      this.reservationDate,
      this.clientId,
      this.services,
      this.status,
      this.statusAr,
      this.car,
      this.workshop});

  Reservation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderNumber = json['order_number'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    totalPrice = json['total_price'];
    type = json['type'];
    reservationDate = json['reservation_date'];
    clientId = json['client_id'];
    if (json['services'] != null) {
      services = <Services>[];
      json['services'].forEach((v) {
        services!.add(Services.fromJson(v));
      });
    }
    status = json['status'];
    statusAr = json['status_ar'];
    car = json['car'];
    workshop = json['workshop'] != null ? ReservationWorkshop.fromJson(json['workshop']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['order_number'] = orderNumber;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['total_price'] = totalPrice;
    data['type'] = type;
    data['reservation_date'] = reservationDate;
    data['client_id'] = clientId;
    if (services != null) {
      data['services'] = services!.map((v) => v.toJson()).toList();
    }
    data['status'] = status;
    data['status_ar'] = statusAr;
    data['car'] = car;
    if (workshop != null) {
      data['workshop'] = workshop!.toJson();
    }
    return data;
  }
}

class Services {
  int? id;
  String? arName;
  String? enName;
  String? serviceImage;
  Pivot? pivot;
  List<Media>? media;

  Services({this.id, this.arName, this.enName, this.serviceImage, this.pivot, this.media});

  Services.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    arName = json['ar_name'];
    enName = json['en_name'];
    serviceImage = json['service_image'];
    pivot = json['pivot'] != null ? Pivot.fromJson(json['pivot']) : null;
    if (json['media'] != null) {
      media = <Media>[];
      json['media'].forEach((v) {
        media!.add(Media.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['ar_name'] = arName;
    data['en_name'] = enName;
    data['service_image'] = serviceImage;
    if (pivot != null) {
      data['pivot'] = pivot!.toJson();
    }
    if (media != null) {
      data['media'] = media!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Pivot {
  int? orderId;
  int? serviceId;
  String? status;
  int? price;
  int? astimatedTime;
  String? astimatedTimeType;

  Pivot({this.orderId, this.serviceId, this.status, this.price, this.astimatedTime, this.astimatedTimeType});

  Pivot.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    serviceId = json['service_id'];
    status = json['status'];
    price = json['price'];
    astimatedTime = json['astimated_time'];
    astimatedTimeType = json['astimated_time_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['order_id'] = orderId;
    data['service_id'] = serviceId;
    data['status'] = status;
    data['price'] = price;
    data['astimated_time'] = astimatedTime;
    data['astimated_time_type'] = astimatedTimeType;
    return data;
  }
}

class Media {
  int? id;
  String? modelType;
  int? modelId;
  String? uuid;
  String? collectionName;
  String? name;
  String? fileName;
  String? mimeType;
  String? disk;
  String? conversionsDisk;
  int? size;
  List<Null>? manipulations;
  List<Null>? customProperties;
  GeneratedConversions? generatedConversions;
  List<Null>? responsiveImages;
  int? orderColumn;
  String? createdAt;
  String? updatedAt;
  String? originalUrl;
  String? previewUrl;

  Media(
      {this.id,
      this.modelType,
      this.modelId,
      this.uuid,
      this.collectionName,
      this.name,
      this.fileName,
      this.mimeType,
      this.disk,
      this.conversionsDisk,
      this.size,
      this.manipulations,
      this.customProperties,
      this.generatedConversions,
      this.responsiveImages,
      this.orderColumn,
      this.createdAt,
      this.updatedAt,
      this.originalUrl,
      this.previewUrl});

  Media.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    modelType = json['model_type'];
    modelId = json['model_id'];
    uuid = json['uuid'];
    collectionName = json['collection_name'];
    name = json['name'];
    fileName = json['file_name'];
    mimeType = json['mime_type'];
    disk = json['disk'];
    conversionsDisk = json['conversions_disk'];
    size = json['size'];

    generatedConversions = json['generated_conversions'] != null
        ? GeneratedConversions.fromJson(json['generated_conversions'])
        : null;

    orderColumn = json['order_column'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    originalUrl = json['original_url'];
    previewUrl = json['preview_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['model_type'] = modelType;
    data['model_id'] = modelId;
    data['uuid'] = uuid;
    data['collection_name'] = collectionName;
    data['name'] = name;
    data['file_name'] = fileName;
    data['mime_type'] = mimeType;
    data['disk'] = disk;
    data['conversions_disk'] = conversionsDisk;
    data['size'] = size;

    if (generatedConversions != null) {
      data['generated_conversions'] = generatedConversions!.toJson();
    }

    data['order_column'] = orderColumn;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['original_url'] = originalUrl;
    data['preview_url'] = previewUrl;
    return data;
  }
}

class GeneratedConversions {
  bool? serviceImage;

  GeneratedConversions({this.serviceImage});

  GeneratedConversions.fromJson(Map<String, dynamic> json) {
    serviceImage = json['service_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['service_image'] = serviceImage;
    return data;
  }
}

class ReservationWorkshop {
  int? id;
  String? logo;
  String? name;
  String? geoLat;
  String? geoLng;

  ReservationWorkshop({this.id, this.logo, this.name, this.geoLat, this.geoLng});

  ReservationWorkshop.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    logo = json['logo'];
    name = json['name'];
    geoLat = json['geo_lat'];
    geoLng = json['geo_lng'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['logo'] = logo;
    data['name'] = name;
    data['geo_lat'] = geoLat;
    data['geo_lng'] = geoLng;
    return data;
  }
}
