// import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import '../store/main.dart';


class TextViewScreen extends StatefulWidget {
  @override
  TextViewScreenState createState() => TextViewScreenState();
}

class TextViewScreenState extends State<TextViewScreen> {
  final MainStore mainStore = SingletonStore.instance;
  bool isLoading = false;
  String text = '';

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData () async {
    isLoading = true;
    var url = '${mainStore.hostName}/${mainStore.currentFileUrl}';
    // var path = mainStore.folderPath;
    // var parameters = json.encode({'Type': 'personal', 'Path': path, 'Pattern': ''});

    // print('Request url: $url');
    try {
      var response = await http.get(
          url, 
          headers: {'Authorization': 'Bearer ${mainStore.authToken}', 'accept-encoding': 'deflate'},
          // body: {'Module': 'Files', 'Method': 'GetFiles', 'Parameters': parameters}
        );

      // print('Request parameters: $parameters');
      // print('Response status: ${response.statusCode}');
      // print('Response contentLength: ${response.contentLength}');
      // print('Response bodyBytes: ${response.bodyBytes}');
      // print('Response headers: ${response.headers}');
      // print('Response body: ${response.body}');
      // print('Response body: ${response.body.toString()}');

      // final tempDir = await getApplicationDocumentsDirectory();
      // final file = await new File('${tempDir.path}/image.jpg').create();
      // file.writeAsBytesSync(list);

      var file = File.fromRawPath(response.bodyBytes);
      text = file.toString();
      setState(() {});
      
    } catch (e) {
      print("Error: $e");
    }


  //   new File('file.txt').readAsString().then((String contents) {
  //   print(contents);
  // });

    // if (response.statusCode == 200) {
    //   // var oResponse = json.decode(response.body);
    //   try {

    //     setState(() {});
    //   } catch (e) {
    //     print(e);
    //     // Nope, wasn't there.
    //   }
    // } else {
    //   throw Exception('Failed to load post');
    // }

    isLoading = false;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Text Viewer', style: Theme.of(context).textTheme.display2),
        actions: [
          IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () => fetchData()),
          // IconButton(
          //     icon: Icon(Icons.menu),
          //     onPressed: () => Navigator.pushNamed(context, '/cart')),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
             Text(text),
            ],
          ),
        ),
        
        // ConstrainedBox(
        //   constraints: BoxConstraints(
        //     // minHeight: .maxHeight,
        //   ),
        //   child: Column(
        //     mainAxisSize: MainAxisSize.min,
        //     mainAxisAlignment: MainAxisAlignment.spaceAround,
        //     children: <Widget>[
        //      Text(text),
        //     ],
        //   ),
        // ),
      ),

      
      // bottomNavigationBar: BottomAppBar(
      //   child: Container(
      //     height: 50.0,
      //   ),
      // ),
      // drawer: Drawer(
      //   child: Text('data'),
      // )
    );
  }
}
