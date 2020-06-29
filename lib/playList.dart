 import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:list_video/myDrawer.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class ListVideo extends StatefulWidget {
  final String title;
  final String url;

  ListVideo({this.title, this.url});

  @override
  _ListVideoState createState() => _ListVideoState();
}

class _ListVideoState extends State<ListVideo> {

  Future<List> getData() async{
      final response = await http.get(widget.url);
      return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(backgroundColor: Colors.pinkAccent,
        title: new Text(widget.title),),
        drawer: new MyDrawer(),
      body: new FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot){
          if(snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? new PlayListVideo(list: snapshot.data,)
              : new CircularProgressIndicator();
        },
      ),
    );
  }
}


class PlayListVideo extends StatelessWidget {

  final List list;
  PlayListVideo({this.list});
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: list==null?0:list.length,
      itemBuilder: (context, i){
        return new Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              new GestureDetector(
                onTap: ()=> Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) =>
                      new VideoPlay(url: "https://youtube.com/embed/${list[i]['contentDetails']['videoId']}",))),
                child: new Container(
                  height: 210.0,
                  decoration: new BoxDecoration(
                    image: new DecorationImage(
                      image: new NetworkImage(list[i]['snippet']['thumbnails']['high']['url']), fit: BoxFit.cover
                    )
                  ),
                ),
              ),
              new Padding(padding: const EdgeInsets.all(10.0)),
              new Text(list[i]['snippet']['title'],
              style: new TextStyle(fontSize: 18.0),),
              new Padding(padding: const EdgeInsets.all(10.0)),
              new Divider(),
            ],
          ),
        );
      },
    );
  }
}

class VideoPlay extends StatelessWidget {

  final String url;

  VideoPlay({this.url});

  @override
  Widget build(BuildContext context) {
    return new Center(
        child: new WebviewScaffold(
          url: url,
        ),
    );
  }
}

