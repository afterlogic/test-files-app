// import 'dart:async';
import 'dart:convert';
// import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// import 'package:flutter_mobx/flutter_mobx.dart';
import '../store/main.dart';

class LoginScreen extends StatefulWidget {
  // const LoginScreen(this.mainStore);
  // final MainStore mainStore;

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  // final MainStore mainStore;
  // LoginScreenState(this.mainStore);
  final MainStore mainStore = SingletonStore.instance;
  bool isLoading = false;

// class LoginScreen extends StatelessWidget {
  final emailFieldController = TextEditingController();
  final passwordFieldController = TextEditingController();
  final FocusNode emailFieldFocus = FocusNode(debugLabel: 'Button1');
  final FocusNode passwordFieldFocus = FocusNode();

  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    emailFieldController.dispose();
    passwordFieldController.dispose();

    emailFieldFocus.dispose();
    passwordFieldFocus.dispose();
    super.dispose();
  }

  void clearToken() {
    mainStore.setOutput('run clearToken');
    print(mainStore.output);
    mainStore.setAuthToken('');
  }

  // @override
  // void initState() {
  //   super.initState();
  //   // Start listening to changes.
  //   emailFieldController.addListener(() {
  //     print("Email text field: ${emailFieldController.text}");
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    void performLogin() async {
      isLoading = true;
      mainStore.setOutput('run performLogin');
      print(mainStore.output);
setState(() {});
      String url = mainStore.apiUrl;
      var parameters = json.encode({"Login": emailFieldController.text,"Password": passwordFieldController.text,"Pattern":""});
      var response = await http.post(url, body: {'Module': 'Core', 'Method': 'Login', 'Parameters': parameters});

      // print('Response status: ${response.statusCode}');
      // print('Response body: ${response.body}');

      mainStore.setOutput('response code: ${response.statusCode}');
      print(mainStore.output);

      if (response.statusCode == 200) {
        var oResponse = json.decode(response.body);
        try {
          // print('just getted token: ${oResponse['Result']['AuthToken']}');
          if (oResponse['Result']['AuthToken'] is String) {
            mainStore.setAuthToken(oResponse['Result']['AuthToken']);
            Navigator.pushReplacementNamed(context, '/list');
          }
        } catch (e) {
          // Nope, wasn't there.
        }
      } else {
        throw Exception('Failed to load post');
      }
      isLoading = false;
      setState(() {});
    }

    return Material(
      color: Colors.blue,
      child: Container(
        decoration: BoxDecoration(
          // Box decoration takes a gradient
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: [0, 1,],
            colors: [
              Color.fromRGBO(10, 132, 178, 1),
              Color.fromRGBO(130, 212, 210, 1),
            ],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 64),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Observer(
                //   builder: (_) => Text('${mainStore.output}', style: TextStyle(fontSize: 10)),
                // ),
                Text('Aurora Files', style: Theme.of(context).textTheme.display4),
                SizedBox(height: 24),
                _LoginTextField(hintText: 'Login', controller: emailFieldController, focusNode: emailFieldFocus),
                SizedBox(height: 12),
                _LoginTextField(hintText: 'Password', obscureText: true, controller: passwordFieldController, focusNode: passwordFieldFocus),
                SizedBox(height: 24),
                FlatButton(
                    color: Colors.pink[600],
                    onPressed: () {
                      performLogin();
                    },
                    child: isLoading ? SizedBox(
                    height: 24.0,
                    width: 24.0,
                    child: CircularProgressIndicator(
                      value: null,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      strokeWidth: 2.0,
                    )
                  ) : Text('Log in', style: Theme.of(context).textTheme.display1),
                ),
                // Observer(
                //   builder: (_) => Text('${mainStore.authToken}', style: TextStyle(fontSize: 10)),
                // ),
                // FlatButton(
                //   color: Colors.indigo,
                //   onPressed: () => Navigator.pushNamed(context, '/list'),
                //   child: Text('Go to list', style: Theme.of(context).textTheme.display1),
                // ),
                FlatButton(
                  color: Colors.cyan[800],
                  onPressed: () => clearToken(),
                  child: Text('Clear token', style: Theme.of(context).textTheme.display1),
                ),
              ]
            ),
          ),
        ),
      )
    );
  }
}

class _LoginTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final Object controller;
  final FocusNode focusNode;

  _LoginTextField({
    Key key,
    @required this.hintText,
    this.obscureText = false,
    @required this.controller,
    this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        hintText: hintText,
        fillColor: Colors.black12,
      ),
      obscureText: obscureText,
      controller: controller,
      onFieldSubmitted: (term) {
        focusNode.unfocus();
        // FocusScope.of(context).requestFocus(nextFocus);
      },
    );
  }
}
