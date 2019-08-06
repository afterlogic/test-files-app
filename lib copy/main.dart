import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// import './models/cart.dart';
import './models/user.dart';
import './screens/cart.dart';
import './screens/folder-list.dart';
import './screens/catalog.dart';
import './screens/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => UserModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.pink,
          textTheme: TextTheme(
            display4: TextStyle(
              fontFamily: 'Corben',
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: Colors.black,
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
          ),
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => LoginScreen(),
          '/list': (context) => FolderList(),
          '/catalog': (context) => MyCatalog(),
          '/cart': (context) => MyCart(),

        },
      ),
    );
  }
}