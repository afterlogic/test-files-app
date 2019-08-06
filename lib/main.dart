import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import './models/cart.dart';
// import './models/user.dart';
// import 'package:aurorafiles/screens/image-view.dart';
// import 'package:aurorafiles/screens/text-view.dart';
import 'package:aurorafiles/screens/file-viewer.dart';

import './screens/cart.dart';
import './screens/catalog.dart';
import './screens/login.dart';
import './screens/folder.dart';
import './screens/intro.dart';
import './screens/ui.dart';
import './screens/todo.dart';

import './store/main.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // final MainStore mainStore = MainStore();
  final MainStore mainStore = SingletonStore.instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        textTheme: TextTheme(
          display4: TextStyle(
            fontFamily: 'Corben',
            fontWeight: FontWeight.w300,
            fontSize: 24,
            color: Colors.white,
          ),
          display1: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14,
            color: Colors.white,
          ),
          display2: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: Colors.white,
          ),
          display3: TextStyle(
            // fontWeight: FontWeight.w400,
            fontSize: 14,
            color: Colors.grey[600],
          ),
          caption: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: Colors.grey[400],
          ),
        ),
      ),
      initialRoute: '/login',

      routes: {
        '/': (context) => IntroScreen(),
        '/login': (context) => LoginScreen(),
        '/list': (context) => Folder(),
        // '/view': (context) => ImageViewScreen(),
        // '/view-txt': (context) => TextViewScreen(),
        '/file-viewer': (context) => FileViewerScreen(),
        '/catalog': (context) => MyCatalog(),
        '/cart': (context) => MyCart(),
        '/ui': (context) => UiScreen(),
        '/todo': (context) => TodoScreen(),
      },
    );
  }
}