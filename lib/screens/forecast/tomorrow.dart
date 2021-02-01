import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Tomorrow extends StatefulWidget {
  final String icon;
  final int min;
  final int max;
  final String summary;
  final int pressure;
  final int humidity;
  final int precipChance;
  final String precipType;
  final int minApparentTemp;
  final int maxApparentTemp;
  final String sunrise;
  final String sunset;

  const Tomorrow(
      {Key key,
      this.icon,
      this.min,
      this.max,
      this.summary,
      this.pressure,
      this.humidity,
      this.precipChance,
      this.precipType,
      this.minApparentTemp,
      this.maxApparentTemp,
      this.sunrise,
      this.sunset})
      : super(key: key);

  @override
  _TomorrowState createState() => _TomorrowState();
}

class _TomorrowState extends State<Tomorrow> {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final format = DateFormat.Hms();

    return Scaffold(
      backgroundColor: Colors.lightBlue[100],
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 96),
              Container(
                margin: EdgeInsets.only(left: 4, right: 4),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 15,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Ziua: ${widget.max}°C",
                                  style: TextStyle(fontSize: 24)),
                              Text("Noaptea: ${widget.min}°C",
                                  style: TextStyle(fontSize: 24)),
                              SizedBox(height: 32),
                              Container(
                                width: 120,
                                child: Text("${widget.summary}"),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Image.asset(
                                "assets/images/${widget.icon}.png",
                                height: 150,
                              ),
                              SizedBox(height: 4),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      )
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 4, right: 4),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 15,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 16),
                      Text(
                        "DETALII",
                        style: TextStyle(
                            color: Colors.blue[800],
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Container(
                                alignment: Alignment.topLeft,
                                padding: EdgeInsets.only(left: 16, right: 16),
                                //width: deviceSize.width - 16,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Presiune atmosferică"),
                                    Text("Umiditate"),
                                    Text("Șanse de precipitații"),
                                    Text("Tip de precipitații"),
                                    Text("Temperatura minimă resimțită"),
                                    Text("Temperatura maximă resimțită"),
                                    Text("Răsăritul soarelui"),
                                    Text("Apusul soarelui")
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Container(
                            alignment: Alignment.bottomRight,
                            margin: EdgeInsets.only(right: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(widget.pressure.toString() + " hPa"),
                                Text(widget.humidity.toString() + " %"),
                                Text(widget.precipChance.toString() + " %"),
                                Text(widget.precipType.toString() == "rain"
                                    ? "Ploaie"
                                    : "Ninsoare"),
                                Text(widget.minApparentTemp.toString() + "°C"),
                                Text(widget.maxApparentTemp.toString() + "°C"),
                                Text(DateFormat.Hm()
                                    .format(DateTime.fromMillisecondsSinceEpoch(
                                        int.parse(widget.sunrise) * 1000))
                                    .toString()),
                                Text(DateFormat.Hm()
                                    .format(DateTime.fromMillisecondsSinceEpoch(
                                        int.parse(widget.sunset) * 1000))
                                    .toString()),
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 16, //
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
