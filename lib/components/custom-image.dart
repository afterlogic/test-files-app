import 'package:flutter/material.dart';
import '../store/main.dart';

class CustomImage extends StatelessWidget {
  CustomImage(this.url);
  final String url;
  final MainStore mainStore = SingletonStore.instance;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      '${mainStore.hostName}/$url',
      headers: {'Authorization': 'Bearer ${mainStore.authToken}'},
    );
  }
  // Widget build(BuildContext context) => FadeInImage.assetNetwork(
  //   placeholder: 'assets/waiting.png',
  //   image: 'https://picsum.photos/48?image=10',
  // );
}