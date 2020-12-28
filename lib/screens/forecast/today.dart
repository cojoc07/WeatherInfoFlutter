import 'package:flutter/material.dart';

class Today extends StatefulWidget {
  //today
  final String icon;
  final int temp;
  final int apparentTemp;
  final int day;
  final int night;
  final String summary;
  final int min;
  final int max;

  const Today(
      {Key key,
      this.icon,
      this.temp,
      this.apparentTemp,
      this.day,
      this.night,
      this.summary,
      this.min,
      this.max})
      : super(key: key);

  @override
  _TodayState createState() => _TodayState();
}

class _TodayState extends State<Today> {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      body: Center(
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
                            Text(
                              "ACUM",
                              style: TextStyle(
                                  color: Colors.blue[800],
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 8),
                            Text("Ziua: " + widget.max.toString() + " ° C"),
                            Text("Noaptea: " + widget.min.toString() + " ° C"),
                            Row(
                              children: [
                                Text(widget.temp.toString(),
                                    style: TextStyle(fontSize: 48)),
                                Text("° C", style: TextStyle(fontSize: 28))
                              ],
                            ),
                            Text("Se simt ca " +
                                widget.apparentTemp.toString() +
                                " grade")
                          ],
                        ),
                        Column(
                          children: [
                            Image.asset(
                              "assets/images/${widget.icon}.png",
                              height: 150,
                            ),
                            SizedBox(height: 4),
                            Text(widget.summary)
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
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Text(
                              "SĂPTĂMÂNA ACEASTA",
                              style: TextStyle(
                                  color: Colors.blue[800],
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 8),
                            Container(
                              padding: EdgeInsets.only(left: 16, right: 16),
                              width: deviceSize.width - 16,
                              child: Text(
                                  "Ploaie usoara de azi pana duminica, cu posibile ploi in timpul noptii si temperaturi ce urca pana la 18 grade sambata."),
                            ),
                          ],
                        ),
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
    );
  }
}
