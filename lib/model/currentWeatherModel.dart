class CurrentWeatherModel {
  double? latitude;
  double? longitude;

  String? timezone;
  String? timezoneAbbreviation;

  CurrentWeatherUnits? currentWeatherUnits;
  CurrentWeather? currentWeather;

  CurrentWeatherModel(
      {this.latitude,
      this.longitude,
      this.timezone,
      this.timezoneAbbreviation,
      this.currentWeatherUnits,
      this.currentWeather});

  CurrentWeatherModel.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];

    timezone = json['timezone'];
    timezoneAbbreviation = json['timezone_abbreviation'];
    currentWeatherUnits = json['current_weather_units'] != null
        ? new CurrentWeatherUnits.fromJson(json['current_weather_units'])
        : null;
    currentWeather = json['current_weather'] != null
        ? new CurrentWeather.fromJson(json['current_weather'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;

    data['timezone_abbreviation'] = this.timezoneAbbreviation;
    if (this.currentWeatherUnits != null) {
      data['current_weather_units'] = this.currentWeatherUnits!.toJson();
    }
    if (this.currentWeather != null) {
      data['current_weather'] = this.currentWeather!.toJson();
    }
    return data;
  }
}

class CurrentWeatherUnits {
  String? time;
  String? interval;
  String? temperature;
  String? windspeed;
  String? winddirection;
  String? isDay;
  String? weathercode;

  CurrentWeatherUnits(
      {this.time,
      this.interval,
      this.temperature,
      this.windspeed,
      this.winddirection,
      this.isDay,
      this.weathercode});

  CurrentWeatherUnits.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    interval = json['interval'];
    temperature = json['temperature'];
    windspeed = json['windspeed'];
    winddirection = json['winddirection'];
    isDay = json['is_day'];
    weathercode = json['weathercode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['time'] = this.time;
    data['interval'] = this.interval;
    data['temperature'] = this.temperature;
    data['windspeed'] = this.windspeed;
    data['winddirection'] = this.winddirection;
    data['is_day'] = this.isDay;
    data['weathercode'] = this.weathercode;
    return data;
  }
}

class CurrentWeather {
  String? time;
  int? interval;
  double? temperature;
  double? windspeed;
  int? winddirection;
  int? isDay;
  int? weathercode;

  CurrentWeather(
      {this.time,
      this.interval,
      this.temperature,
      this.windspeed,
      this.winddirection,
      this.isDay,
      this.weathercode});

  CurrentWeather.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    interval = json['interval'];
    temperature = json['temperature'];
    windspeed = json['windspeed'];
    winddirection = json['winddirection'];
    isDay = json['is_day'];
    weathercode = json['weathercode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['time'] = this.time;
    data['interval'] = this.interval;
    data['temperature'] = this.temperature;
    data['windspeed'] = this.windspeed;
    data['winddirection'] = this.winddirection;
    data['is_day'] = this.isDay;
    data['weathercode'] = this.weathercode;
    return data;
  }
}
