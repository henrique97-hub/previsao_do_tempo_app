class Weather {
  String city;
  String date;
  String condition;
  int maxTemp;
  int minTemp;

  // Retorna objetos instanciados da classe Clima
  factory Weather.fromJson(Map<String, dynamic> jsonMap) {
    return Weather(
        city: jsonMap['resultados']['city'],
        date: jsonMap['resultados']['forecast'][0]['date'],
        condition: jsonMap['results']['forecast'][0]['description'],
        maxTemp: jsonMap['results']['forecast'][0]['max'],
        minTemp: jsonMap['resultados']['forecast'][0]['min']
    );
  }

    Weather({this.city, this.date, this.condition, this.maxTemp, this.minTemp});

}