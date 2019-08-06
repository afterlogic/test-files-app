import 'package:flutter/material.dart';
// import 'package:flutter_mobx/flutter_mobx.dart';
import '../store/main.dart';

import '../components/custom-image.dart';

class ImageViewScreen extends StatelessWidget {
  final MainStore mainStore = SingletonStore.instance;

  @override
  Widget build(BuildContext context) {
    // final currentFile = mainStore.currentFile;
    // print('currentFile');
    // print(currentFile);

    // final screenTitle = currentFile.name ? currentFile.name : 'Image viewer';
    final screenTitle = 'Image viewer';
    String url = mainStore.currentFileUrl;

    return Scaffold(
        appBar: AppBar(
          title: Text(screenTitle, style: Theme.of(context).textTheme.display2),
          // actions: [
          //   IconButton(
          //       icon: Icon(Icons.menu),
          //       onPressed: () => Navigator.pushNamed(context, '/cart')),
          // ],
        ),
        body:  SingleChildScrollView(
        child: Container(
          // padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(16),
                    child: CustomImage(url),
                  ),
                  Container(
                    padding: const EdgeInsets.all(16),
                    color: Colors.grey[200],
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('File info'),
                        Text('${mainStore.hostName}/$url'),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
