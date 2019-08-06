// import 'dart:async';
import 'dart:convert';
// import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import '../models/user.dart';


class LoginScreen extends StatefulWidget {
  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
// class LoginScreen extends StatelessWidget {
  final emailFieldController = TextEditingController();
  final passwordFieldController = TextEditingController();

  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    emailFieldController.dispose();
    passwordFieldController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // Start listening to changes.
    emailFieldController.addListener(() {
      print("Email text field: ${emailFieldController.text}");
    });
  }

  @override
  Widget build(BuildContext context) {
    var userModel = Provider.of<UserModel>(context);

    void performLogin() async {
      var url = 'http://test.afterlogic.com/?Api/';
      var parameters = json.encode({"Login": emailFieldController.text,"Password": passwordFieldController.text,"Pattern":""});
      var response = await http.post(url, body: {'Module': 'Core', 'Method': 'Login', 'Parameters': parameters});

      // print('Response status: ${response.statusCode}');
      // print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        var oResponse = json.decode(response.body);
        try {
          print('just getted token: ${oResponse['Result']['AuthToken']}');
          userModel.populate(oResponse['Result']);
          // MyApp.AuthToken = oResponse['Result']['AuthToken'];
          // Navigator.pushNamed(context, '/files-list');
          Navigator.pushReplacementNamed(context, '/list');
        } catch (e) {
          // Nope, wasn't there.
        }
      } else {
        throw Exception('Failed to load post');
      }
    }

    return Material(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 64),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Aurora Files', style: Theme.of(context).textTheme.display4),
              SizedBox(height: 24),
              _LoginTextField(hintText: 'Login', controller: emailFieldController),
              SizedBox(height: 12),
              _LoginTextField(hintText: 'Password', obscureText: true, controller: passwordFieldController),
              SizedBox(height: 24),
              FlatButton(
                color: Colors.pink,
                onPressed: () => 
                  performLogin(),
                child: Text('Log in', style: Theme.of(context).textTheme.display1),
              ),
              Consumer<UserModel>(
                  builder: (context, user, child) =>
                      Text('The Auth Token is: ${user.authToken}')),
              ],
          ),
        ),
      ),
    );
  }
}

class _LoginTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final Object controller;

  _LoginTextField({
    Key key,
    @required this.hintText,
    this.obscureText = false,
    @required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        fillColor: Colors.black12,
      ),
      obscureText: obscureText,
      controller: controller,
    );
  }
}
