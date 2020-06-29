import 'package:flutter/material.dart';
import 'package:list_video/myDrawer.dart';

void main() => runApp(MyApp(
));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Siti Saadiyah Videos",
      debugShowCheckedModeBanner: false,
      home: new HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: new MyDrawer(),
      appBar: new AppBar(
        backgroundColor: Colors.red[900],
        title: Text('PLAYLIST VIDEO'),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: new Container(
          height: MediaQuery.of(context).size.height/3,
          decoration: new BoxDecoration(
            image:  new DecorationImage(
              image: new AssetImage("images/youtubeplaylist1.png"), fit: BoxFit.cover
            )
          ),
         /* child: new Center(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text("Siti Saadiyah", style: new TextStyle(
                  fontSize: 25.0,
                  fontFamily: "Pacifico",
                  color: Colors.pinkAccent
                ),
                ),
                new Text("-CODING LIFE-", style: new TextStyle(
                    fontSize: 25.0,
                    color: Colors.pinkAccent
                ),)
              ],
            ),
          ),*/
        ),
      ),
    );
  }
}


