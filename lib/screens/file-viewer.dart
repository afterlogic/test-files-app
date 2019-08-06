import 'dart:io';
import 'package:flutter/material.dart';
// import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:downloads_path_provider/downloads_path_provider.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import '../store/main.dart';

import 'package:aurorafiles/components/text-view.dart';
import 'package:aurorafiles/components/image-view.dart';

class FileViewerScreen extends StatelessWidget {
  final MainStore mainStore = SingletonStore.instance;

  @override
  Widget build(BuildContext context) {
    final screenTitle = 'File viewer';
    final file = mainStore.currentFile;

    Widget getViewerWidget() {
      var viewerWidget;
      switch (file['contentType']) {
        case 'image/jpeg':
        case 'image/png':
          viewerWidget = ImageViewer();
          print('image');
          break;
        case 'text/plain':
          viewerWidget = TextViewer();
          print('text');
          break;
        default: 
          viewerWidget = Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 16),
            child: Text('TODO Add raw file viewer')
          );
      }
      return viewerWidget;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(screenTitle, style: Theme.of(context).textTheme.display2),
        actions: [
          IconButton(
            icon: Icon(Icons.file_download),
            onPressed: () => downloadFile()
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: getViewerWidget()
      ),
    );
  }

  void downloadFile() {
    Future<Directory> downloadsDirectory = DownloadsPathProvider.downloadsDirectory;

    downloadsDirectory.then((Directory directory) {
      // print(directory.path);
      // final filename = '${directory.path}/file.txt';
      // print(filename);
      downloadFile1(directory.path);
    //   new File(filename).writeAsString('some content')
    //     .then((File file) {
    //       print('save');
    // //       // Do something with the file.
    //     });
      
    });
  }

  void downloadFile1(dir) async {
      print(dir);
      final taskId = await FlutterDownloader.enqueue(
        url: 'https://afterlogic.com/images/star-bg.jpg',
        savedDir: dir,
        showNotification: true, // show download progress in status bar (for Android)
      //   openFileFromNotification: true, // click on notification to open downloaded file (for Android)
      );
      // print(taskId);
  }
}
