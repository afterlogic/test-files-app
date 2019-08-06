import 'package:flutter/material.dart';
// import '../store/main.dart';

class CustomFolderItem extends StatelessWidget {
  const CustomFolderItem({
    this.title,
    this.onTap,
  });

  final String title;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        if (onTap is Function) {
          onTap();
        }
      },
      child:  Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Icon(Icons.folder, size: 48, color: Colors.blue),
            ),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}