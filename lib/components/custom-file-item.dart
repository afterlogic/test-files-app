import 'package:flutter/material.dart';
import './custom-image.dart';

class CustomFileItem extends StatelessWidget {
  const CustomFileItem({
    this.type,
    this.url,
    this.thumbnail,
    this.title,
    this.user,
    this.size,
    this.timestamp,
    this.onTap,
  });

  final String type;
  final String url;
  final Widget thumbnail;
  final String title;
  final String user;
  final int size;
  final int timestamp;
  final Function onTap;

  // var isSelected = false;

  @override
  Widget build(BuildContext context) {
    var oDate = new DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    var userFriendlyDate = '${oDate.year}.${oDate.month}.${oDate.day} ${oDate.hour}:${oDate.minute}';
    var userFriendlySize = (size / 1024).ceil();
    Widget thumbnail;

    switch (type) {
       case 'image/jpeg':
       case 'image/png':
          thumbnail = CustomImage(url);
        break;
       default: 
          thumbnail = Icon(Icons.description, size: 48, color: Colors.grey[700]);
    }

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        if (onTap is Function) {
          onTap();
        }
      },
      // onLongPress: toggleSelection,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 1,
              // child: isSelected ? 
              // Text('data') :
              child:
              Padding(padding: EdgeInsets.only(right: 8.0), child: thumbnail),
            ),
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14.0,
                    ),
                  ),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
                  Text(userFriendlyDate, style: const TextStyle(fontSize: 10.0)),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 1.0)),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  const Padding(padding: EdgeInsets.symmetric(vertical: 1.0)),
                  Text(
                    '$userFriendlySize kB',
                    style: const TextStyle(fontSize: 10.0),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // void toggleSelection() {
  //   setState(() {
  //     if (isSelected) {
  //       // mycolor=Colors.white;
  //       isSelected = false;
  //     } else {
  //       // mycolor=Colors.grey[300];
  //       isSelected = true;
  //     }
  //   });
  // }
}