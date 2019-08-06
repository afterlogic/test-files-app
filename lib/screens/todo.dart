// import 'dart:convert';
// import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
// import 'package:flutter_mobx/flutter_mobx.dart';
// import '../store/main.dart';

class TodoScreen extends StatefulWidget {
  // const TodoScreen(this.mainStore);
  // final MainStore mainStore;

  @override
  // TodoScreenState createState() => TodoScreenState(mainStore);
  TodoScreenState createState() => TodoScreenState();
}

class TodoScreenState extends State<TodoScreen> {
  // final MainStore mainStore = MainStore();
  // final MainStore mainStore;
  // TodoScreenState(this.mainStore);

  // @override
  // void initState() {
  //   super.initState();
  //   print('init Todo screen');
  // }

  List<String> litems = [];
  final TextEditingController eCtrl = new TextEditingController();

  void testF () {
    litems.add('222');
    eCtrl.clear();
    setState(() {});
  }
  @override
  Widget build (BuildContext ctxt) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Dynamic Demo"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              litems.add('D');
              setState(() {});
              print('click');
            }
          ),
        ],
      ),
      body: new Column(
        children: <Widget>[
          new TextField(
            controller: eCtrl,
            onSubmitted: (text) {
              // litems.add('111');
              // eCtrl.clear();
              // setState(() {});
              testF();
            },
          ),
          new Expanded(
            child: new ListView.builder
              (
                itemCount: litems.length,
                itemBuilder: (BuildContext ctxt, int index) {
                  return new Text(litems[index]);
                }
            )
        )
        ],
      )
    );
  }
}
