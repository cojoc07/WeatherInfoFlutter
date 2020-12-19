import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:traffic_weather/screens/test/fullscreen_image.dart';

class WallScreen extends StatefulWidget {
  @override
  _WallScreenState createState() => new _WallScreenState();
}

class _WallScreenState extends State<WallScreen> {
  List<String> wallpapersList = new List<String>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    wallpapersList.add(
        "https://cdn.pixabay.com/photo/2020/10/27/21/24/lake-5691976_960_720.jpg");
    wallpapersList.add(
        "https://cdn.pixabay.com/photo/2020/11/30/10/58/barberry-5790609_960_720.jpg");
    wallpapersList.add(
        "https://cdn.pixabay.com/photo/2020/11/01/21/45/christmas-5705046_960_720.jpg");
    wallpapersList.add(
        "https://cdn.pixabay.com/photo/2019/12/11/18/06/dog-4688913_960_720.jpg");

    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Wallfy"),
        ),
        body: wallpapersList != null
            ? new StaggeredGridView.countBuilder(
                padding: const EdgeInsets.all(8.0),
                crossAxisCount: 4,
                itemCount: wallpapersList.length,
                itemBuilder: (context, i) {
                  String imgPath = wallpapersList[i];
                  return new Material(
                    elevation: 8.0,
                    borderRadius:
                        new BorderRadius.all(new Radius.circular(8.0)),
                    child: new InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) =>
                                    new FullScreenImagePage(imgPath)));
                      },
                      child: new Hero(
                        tag: imgPath,
                        child: new FadeInImage(
                          image: new NetworkImage(imgPath),
                          fit: BoxFit.cover,
                          placeholder:
                              new AssetImage("assets/images/cityscape.png"),
                        ),
                      ),
                    ),
                  );
                },
                staggeredTileBuilder: (i) =>
                    new StaggeredTile.count(2, i.isEven ? 2 : 3),
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
              )
            : new Center(
                child: new CircularProgressIndicator(),
              ));
  }
}
