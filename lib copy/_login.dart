import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '_post.dart';
// import 'list.dart';

class LoginForm extends StatefulWidget {
  @override
  LoginFormState createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
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

  void performLogin() async {
    var url = 'http://test.afterlogic.com/?Api/';
    var parameters = json.encode({"Login": emailFieldController.text,"Password": passwordFieldController.text,"Pattern":""});
    var response = await http.post(url, body: {'Module': 'Core', 'Method': 'Login', 'Parameters': parameters});

    // print('Response status: ${response.statusCode}');
    // print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      var oResponse = json.decode(response.body);
      try {
        print(oResponse['Result']['AuthToken']);
        Navigator.pushNamed(context, '/files-list');
      } catch (e) {
        // Nope, wasn't there.
      }
    } else {
      throw Exception('Failed to load post');
    }
  }

  var sTitletext = 'Login screen';

  Future<Post> fetchPost() async {
    final response = await http.get('https://jsonplaceholder.typicode.com/posts/1');

    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON.
      return Post.fromJson(json.decode(response.body));
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load post');
    }
  }

  @override
  Widget build(BuildContext context) {
    String authToken = '';
    // Build a Form widget using the _formKey created above.
    return Scaffold(
      appBar: AppBar(
        title: Text(sTitletext),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email'
                ),
                controller: emailFieldController,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Enter some text';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Password'
                ),
                controller: passwordFieldController,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Enter some text';
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: RaisedButton(
                  onPressed: () {
                    performLogin();
                  },
                  child: Text('Submit'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text(authToken),
              ),
              // CircularProgressIndicator(),
              FutureBuilder<Post>(
                future: fetchPost(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(snapshot.data.title);
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }

                  // By default, show a loading spinner.
                  return CircularProgressIndicator();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
