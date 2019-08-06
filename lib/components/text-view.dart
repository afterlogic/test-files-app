// import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import '../store/main.dart';

class TextViewer extends StatefulWidget {
  @override
  TextViewerState createState() => TextViewerState();
}

class TextViewerState extends State<TextViewer> {
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
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: isLoading ?
      Center(
        child: CircularProgressIndicator()
      )
      :
      Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text(text),
        ],
      ),
    );
  }
}
