class PlaceModel {
  List<Results>? results;
  double? generationtimeMs;

  PlaceModel({this.results, this.generationtimeMs});

  PlaceModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(new Results.fromJson(v));
      });
    }
    generationtimeMs = json['generationtime_ms'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    data['generationtime_ms'] = this.generationtimeMs;
    return data;
  }
}

class Results {
  int? id;
  String? name;
  double? latitude;
  double? longitude;
  String? featureCode;
  String? countryCode;
  String? timezone;
  dynamic countryId;
  String? country;

  Results({
    this.id,
    this.name,
    this.latitude,
    this.longitude,
    this.featureCode,
    this.countryCode,
    this.countryId,
    this.country,
  });

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    featureCode = json['feature_code'];
    countryCode = json['country_code'];
    timezone = json['timezone'];
    countryId = json['country_id'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['feature_code'] = this.featureCode;
    data['country_code'] = this.countryCode;
    data['timezone'] = this.timezone;
    data['country_id'] = this.countryId;
    data['country'] = this.country;
    return data;
  }
}
