import 'package:flutter/material.dart';
import 'package:list_video/playList.dart';


class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: SingleChildScrollView(
        child: new Column(
          children: <Widget>[
            new Padding(padding: const EdgeInsets.all(20.0)),
            new ListTile(
              leading: new Icon(Icons.home, color: Colors.green,),
              title: new Text("HOME", style: new TextStyle(fontSize: 18.0, color: Colors.green),),
            ),
            new Divider(),
            new ListTile(
              leading: new Icon(Icons.video_library, color: Colors.blue,),
              title: new Text("FLUTTER", style: new TextStyle(fontSize: 18.0, color: Colors.blue),),
              onTap: ()=>Navigator.of(context).push(
                new MaterialPageRoute(builder: (BuildContext context)=>new ListVideo(
                  url: "https://flutterrlist.herokuapp.com/",
                  title: "FLUTTER",
                )
                )),
            ),
            new Divider(),
            new ListTile(
              leading: new Icon(Icons.video_library, color: Colors.orange,),
              title: new Text("CODEIGNITER", style: new TextStyle(fontSize: 18.0, color: Colors.orange),),
              onTap: ()=>Navigator.of(context).push(
                  new MaterialPageRoute(builder: (BuildContext context)=>new ListVideo(
                    url: "https://cookinglist.herokuapp.com/",
                    title: "CODE",
                  )
                  )),
            ),
            new Divider(),
            new ListTile(
              leading: new Icon(Icons.video_library, color: Colors.red[900],),
              title: new Text("LARAVEL", style: new TextStyle(fontSize: 18.0,color: Colors.red[900]),),
              onTap: ()=>Navigator.of(context).push(
                  new MaterialPageRoute(builder: (BuildContext context)=>new ListVideo(
                    url: "https://flutterlist1.herokuapp.com/",
                    title: "LARAVEL",
                  )
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
