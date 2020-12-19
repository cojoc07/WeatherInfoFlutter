import 'package:flutter/material.dart';

class Today extends StatefulWidget {
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
            SizedBox(height: 8),
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
                          children: [
                            Text("ACUM",
                                style: TextStyle(
                                    color: Colors.blue[800],
                                    fontWeight: FontWeight.bold)),
                            Text("Ziua: 12 C"),
                            Text("Noaptea: -2 C"),
                            Text("19 C", style: TextStyle(fontSize: 28)),
                            Text("Se simt ca 15 grade")
                          ],
                        ),
                        Column(
                          children: [
                            Image.asset(
                              "assets/images/cloudy.png",
                              height: 150,
                            ),
                            SizedBox(height: 4),
                            Text("Cer innorat")
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
                              "SAPTAMANA ACEASTA",
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
