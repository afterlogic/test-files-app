import 'package:flutter/material.dart';
import '../store/main.dart';

import '../components/custom-image.dart';

class ImageViewer extends StatelessWidget {
  final MainStore mainStore = SingletonStore.instance;

  @override
  Widget build(BuildContext context) {
    String url = mainStore.currentFileUrl;

    return Container(
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
                child: Stack(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.only(top: 8),
                      child: CircularProgressIndicator(),
                    ),
                    Center(
                      child: CustomImage(url),
                    ),
                  ],
                ),
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
    );
  }
}
