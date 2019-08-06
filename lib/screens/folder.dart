import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import '../store/main.dart';
import '../components/custom-file-item.dart';
import '../components/custom-folder-item.dart';

class Folder extends StatefulWidget {
  
  @override
  FolderState createState() => FolderState();
}

class FolderState extends State<Folder> {
  final MainStore mainStore = SingletonStore.instance;
  final listItems = [];
  final files = [];
  final folders = [];
  bool isLoading = false;
  var reloadReactionDisposer;

  void reloadFolder () async {
    // mainStore.setOutput('run reloadFolder');
    // print(mainStore.output);

    if (mainStore.authToken == '') {
      mainStore.setOutput('empty AuthToken');
      print(mainStore.output);
      return;
    }

    isLoading = true;
    setState(() {});
    var url = mainStore.apiUrl;
    var path = mainStore.folderPath;

    var parameters = json.encode({'Type': 'personal', 'Path': path, 'Pattern': ''});
    var response = await http.post(url, 
    headers: {'Authorization': 'Bearer ${mainStore.authToken}'},
    body: {'Module': 'Files', 'Method': 'GetFiles', 'Parameters': parameters});

    // print('Request parameters: $parameters');
    // print('Response status: ${response.statusCode}');
    // print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      var oResponse = json.decode(response.body);
      try {
        // if (oResponse['Result']['Items']) {
          files.clear();
          folders.clear();
          oResponse['Result']['Items'].forEach((element) {
            if (element['IsFolder'] == true) {
              folders.add({
                'type': 'folder',
                'name': element['Name'],
                'owner': element['Owner'],
                'path': element['FullPath'],
              });
            } else {
              files.add({
                'type': 'file',
                'contentType': element['ContentType'],
                'name': element['Name'],
                'size': element['Size'],
                'url': element['Actions']['view']['url'],
                'thumbnailUrl': element['ThumbnailUrl'],
                'owner': element['Owner'],
                'modified': element['LastModified'],
              });
            }
          });
          // currently sorting is not necessary, but lately this should be done here somehow like this 
          // files.sort((a, b) => a.name.compareTo(b.name));
          // folders.sort((a, b) => a.name.compareTo(b.name));
          listItems
            ..clear()
            ..addAll(folders)
            ..addAll(files);
        // }
        setState(() {});
      } catch (e) {
        print(e);
        // Nope, wasn't there.
      }
    } else {
      throw Exception('Failed to load post');
    }
    setState(() {});
    isLoading = false;
  }

  void levelUp () {
    var currentPath = mainStore.folderPath;
    var pathArray = currentPath.split(new RegExp(r"/"));
    pathArray.removeLast();
    var newPath = pathArray.join("/");
    mainStore.setFolderPath(newPath);
  }

  @override
  void initState() {
    super.initState();
    reloadFolder();
    reloadReactionDisposer = reaction((_) => mainStore.folderPath, (msg) => reloadFolder());
  }

  void dispose() {
    super.dispose();
    try {
      reloadReactionDisposer();
    } catch (e) {
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Files list', style: Theme.of(context).textTheme.display2),
        actions: [
          IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () => reloadFolder()),
          IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () => Navigator.pushNamed(context, '/')),
        ],
      ),
      body: Center(
        child: Observer(
          builder: (_) =>
            Column(
              children: [
                // (mainStore.dev ? Text('output: ${mainStore.output}') : new Container(width: 0, height: 0)),
                Container(
                  color: Colors.grey[200],
                  padding: const EdgeInsets.all(8),
                  alignment: Alignment.centerLeft,
                  child: Text('${mainStore.folderPath}', style: Theme.of(context).textTheme.display3),
                ),
                mainStore.folderPath == '' ? 
                Text('') :
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.all(8),
                  child: GestureDetector(
                    onTap: levelUp,
                    child: Row(
                      children: [
                        Icon(Icons.arrow_upward),
                        Text('Level up'),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: isLoading ?
                    CircularProgressIndicator() :
                    Expanded(
                      child: listItems.length == 0 ? 
                        Text('Folder is empty', style: Theme.of(context).textTheme.caption)
                        : ListView.builder(
                        // : ListView.separated(
                        // padding: const EdgeInsets.all(8.0),
                        itemCount: listItems.length,
                        itemBuilder: (BuildContext context, int index) {
                          final oFile = listItems[index];
                          return Container(
                            // height: 80,
                            color: (index % 2 == 0) ? Colors.grey[000] : Colors.grey[100],
                            child: CustomLineItem(oFile),
                          );
                        },
                        // separatorBuilder: (BuildContext context, int index) => const Divider(),
                      )
                    )
                ),
              ],
            )
        ),
      ),
    );
  }
}

class CustomLineItem extends StatelessWidget {
  CustomLineItem(this.data);
  final data;
  final MainStore mainStore = SingletonStore.instance;

  @override
  Widget build(BuildContext context) {
    final oLineItem = data['type'] == 'file' ? CustomFileItem(
      title: data['name'],
      user: data['owner'],
      timestamp: data['modified'],
      size: data['size'],
      url: data['thumbnailUrl'],
      type: data['contentType'],
      onTap: () { 
        mainStore.setCurrentFileUrl(data['url']);
        mainStore.setCurrentFile(data);

        // switch (data['contentType']) {
        //   case 'image/jpeg':
        //   case 'image/png':
        //     Navigator.pushNamed(context, '/view');
        //     break;
        //   case 'text/plain':
        //     Navigator.pushNamed(context, '/view-txt');
        //     break;
        //   default: 
            Navigator.pushNamed(context, '/file-viewer');
        // }
      },
    ) : CustomFolderItem(
      title: data['name'],
      onTap: () => mainStore.setFolderPath(data['path']),
    );

    return oLineItem;
  }
}