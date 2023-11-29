class WeatherResponse {
  String? cod;
  int? message;
  int? cnt;
  List<WeatherData>? list;
  City? city;

  WeatherResponse({
    this.cod,
    this.message,
    this.cnt,
    this.list,
    this.city,
  });

  factory WeatherResponse.fromJson(Map<String, dynamic> json) =>
      WeatherResponse(
        cod: json['cod'] as String?,
        message: json['message'] as int?,
        cnt: json['cnt'] as int?,
        list: (json['list'] as List<dynamic>?)
            ?.map((e) => WeatherData.fromJson(e as Map<String, dynamic>))
            .toList(),
        city: json['city'] != null
            ? City.fromJson(json['city'] as Map<String, dynamic>)
            : null,
      );

  Map<String, dynamic> toJson() => {
        'cod': cod,
        'message': message,
        'cnt': cnt,
        'list': list?.map((e) => e.toJson()).toList(),
        'city': city?.toJson(),
      };
}

class WeatherData {
  int? dt;
  Main? main;
  List<Weather>? weather;
  Clouds? clouds;
  Wind? wind;
  int? visibility;
  double? pop;
  Rain? rain;
  Sys? sys;
  String? dtTxt;

  WeatherData({
    this.dt,
    this.main,
    this.weather,
    this.clouds,
    this.wind,
    this.visibility,
    this.pop,
    this.rain,
    this.sys,
    this.dtTxt,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) => WeatherData(
        dt: json['dt'] as int?,
        main: json['main'] != null
            ? Main.fromJson(json['main'] as Map<String, dynamic>)
            : null,
        weather: (json['weather'] as List<dynamic>?)
            ?.map((e) => Weather.fromJson(e as Map<String, dynamic>))
            .toList(),
        clouds: json['clouds'] != null
            ? Clouds.fromJson(json['clouds'] as Map<String, dynamic>)
            : null,
        wind: json['wind'] != null
            ? Wind.fromJson(json['wind'] as Map<String, dynamic>)
            : null,
        visibility: json['visibility'] as int?,
        pop: (json['pop'] as num?)?.toDouble(),
        rain: json['rain'] != null
            ? Rain.fromJson(json['rain'] as Map<String, dynamic>)
            : null,
        sys: json['sys'] != null
            ? Sys.fromJson(json['sys'] as Map<String, dynamic>)
            : null,
        dtTxt: json['dt_txt'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'dt': dt,
        'main': main?.toJson(),
        'weather': weather?.map((e) => e.toJson()).toList(),
        'clouds': clouds?.toJson(),
        'wind': wind?.toJson(),
        'visibility': visibility,
        'pop': pop,
        'rain': rain?.toJson(),
        'sys': sys?.toJson(),
        'dt_txt': dtTxt,
      };
}

class Main {
  double? temp;
  double? feelsLike;
  double? tempMin;
  double? tempMax;
  int? pressure;
  int? seaLevel;
  int? grndLevel;
  int? humidity;
  double? tempKf;

  Main({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.seaLevel,
    this.grndLevel,
    this.humidity,
    this.tempKf,
  });

  factory Main.fromJson(Map<String, dynamic> json) => Main(
        temp: (json['temp'] as num?)?.toDouble(),
        feelsLike: (json['feels_like'] as num?)?.toDouble(),
        tempMin: (json['temp_min'] as num?)?.toDouble(),
        tempMax: (json['temp_max'] as num?)?.toDouble(),
        pressure: json['pressure'] as int?,
        seaLevel: json['sea_level'] as int?,
        grndLevel: json['grnd_level'] as int?,
        humidity: json['humidity'] as int?,
        tempKf: (json['temp_kf'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'temp': temp,
        'feels_like': feelsLike,
        'temp_min': tempMin,
        'temp_max': tempMax,
        'pressure': pressure,
        'sea_level': seaLevel,
        'grnd_level': grndLevel,
        'humidity': humidity,
        'temp_kf': tempKf,
      };
}

class Weather {
  int? id;
  String? main;
  String? description;
  String? icon;

  Weather({
    this.id,
    this.main,
    this.description,
    this.icon,
  });

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        id: json['id'] as int?,
        main: json['main'] as String?,
        description: json['description'] as String?,
        icon: json['icon'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'main': main,
        'description': description,
        'icon': icon,
      };
}

class Clouds {
  int? all;

  Clouds({
    this.all,
  });

  factory Clouds.fromJson(Map<String, dynamic> json) => Clouds(
        all: json['all'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'all': all,
      };
}

class Wind {
  double? speed;
  int? deg;
  double? gust;

  Wind({
    this.speed,
    this.deg,
    this.gust,
  });

  factory Wind.fromJson(Map<String, dynamic> json) => Wind(
        speed: (json['speed'] as num?)?.toDouble(),
        deg: json['deg'] as int?,
        gust: (json['gust'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'speed': speed,
        'deg': deg,
        'gust': gust,
      };
}

class Rain {
  double? h3;

  Rain({
    this.h3,
  });

  factory Rain.fromJson(Map<String, dynamic> json) => Rain(
        h3: (json['3h'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        '3h': h3,
      };
}

class Sys {
  String? pod;

  Sys({
    this.pod,
  });

  factory Sys.fromJson(Map<String, dynamic> json) => Sys(
        pod: json['pod'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'pod': pod,
      };
}

class City {
  int? id;
  String? name;
  Coord? coord;
  String? country;
  int? population;
  int? timezone;
  int? sunrise;
  int? sunset;

  City({
    this.id,
    this.name,
    this.coord,
    this.country,
    this.population,
    this.timezone,
    this.sunrise,
    this.sunset,
  });

  factory City.fromJson(Map<String, dynamic> json) => City(
        id: json['id'] as int?,
        name: json['name'] as String?,
        coord: json['coord'] != null
            ? Coord.fromJson(json['coord'] as Map<String, dynamic>)
            : null,
        country: json['country'] as String?,
        population: json['population'] as int?,
        timezone: json['timezone'] as int?,
        sunrise: json['sunrise'] as int?,
        sunset: json['sunset'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'coord': coord?.toJson(),
        'country': country,
        'population': population,
        'timezone': timezone,
        'sunrise': sunrise,
        'sunset': sunset,
      };
}

class Coord {
  double? lat;
  double? lon;

  Coord({
    this.lat,
    this.lon,
  });

  factory Coord.fromJson(Map<String, dynamic> json) => Coord(
        lat: (json['lat'] as num?)?.toDouble(),
        lon: (json['lon'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'lat': lat,
        'lon': lon,
      };
}
