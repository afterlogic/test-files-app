import 'package:flutter/material.dart';


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    // final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width;

    return new Container(
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 24.0, 0.0, 0.0),
            child: new Image.asset(
              'assets/rp1.jpg',
              height: 200.0,
              width: itemWidth,
            ),
          ),
          new Padding(
            padding: const EdgeInsets.all(12.0),
            child: new Text(
              "Some Heading Text",
              style: new TextStyle(
                  fontSize: 28.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            ),
          ),
          new Expanded(
            flex: 1,
            child: new SingleChildScrollView(
              child: new Text(
                "1 Description that is too long in text format(Here Data is coming from API) jdlksaf j klkjjflkdsjfkddfdfsdfds " + 
                "2 Description that is too long in text format(Here Data is coming from API) d fsdfdsfsdfd dfdsfdsf sdfdsfsd d " + 
                "3 Description that is too long in text format(Here Data is coming from API)  adfsfdsfdfsdfdsf   dsf dfd fds fs" + 
                "4 Description that is too long in text format(Here Data is coming from API) dsaf dsafdfdfsd dfdsfsda fdas dsad" + 
                "5 Description that is too long in text format(Here Data is coming from API) dsfdsfd fdsfds fds fdsf dsfds fds " + 
                "6 Description that is too long in text format(Here Data is coming from API) asdfsdfdsf fsdf sdfsdfdsf sd dfdsf" + 
                "7 Description that is too long in text format(Here Data is coming from API) df dsfdsfdsfdsfds df dsfds fds fsd" + 
                "8 Description that is too long in text format(Here Data is coming from API)" + 
                "9 Description that is too long in text format(Here Data is coming from API)" + 
                "10 Description that is too long in text format(Here Data is coming from API)",     
                style: new TextStyle(
                  fontSize: 16.0, color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}