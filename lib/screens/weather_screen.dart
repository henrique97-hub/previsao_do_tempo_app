import 'package:flutter/material.dart';
import 'package:previsao_do_tempo_app/models/weather.dart';
import 'package:previsao_do_tempo_app/models/weather_repository.dart';
import 'package:flutter/cupertino.dart';


class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Usando API',
      home: Scaffold(
          backgroundColor: Colors.blueGrey[900],
          appBar: AppBar(
            centerTitle: true,
            title: Text('App Teste'),
          ),
          body: FutureBuilder<Weather>(
            //IMPORTANTE
            future: getWeather(), //IMPORTANTE
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        snapshot.data.date,
                        style: TextStyle(fontSize: 30.0, color: Colors.white),
                      ),
                      Icon(
                        Icons.cloud,
                        size: 250.0,
                        color: Colors.blue,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 30.0),
                        child: Text(
                          snapshot.data.condition,
                          style: TextStyle(fontSize: 20.0, color: Colors.white),
                        ),
                      ),
                      Text(
                          "Máxima: ${snapshot.data.maxTemp.toString()}°", //IMPORTANTE
                          style:
                          TextStyle(fontSize: 20.0, color: Colors.white)),
                      Text("Mínima: ${snapshot.data.minTemp.toString()}°",
                          style:
                          TextStyle(fontSize: 20.0, color: Colors.white)),
                    ],
                  ),
                );
              } else {
                return Center(child: CircularProgressIndicator() //IMPORTANTE
                );
              }
            },
          )),
    );
  }
}