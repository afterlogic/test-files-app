import 'package:flutter/material.dart';
// import 'package:flutter_mobx/flutter_mobx.dart';

class IntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Splash screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Extra screens',
              style: TextStyle(fontSize: 30.0),
            ),
            // Observer(
            //     builder: (_) =>
            //         Text('asd', style: TextStyle(fontSize: 42.0)),
            //   ),
            // Text(
            //   '0', 
            //   style: TextStyle(fontSize: 42.0),
            // ),
            FlatButton.icon(
              icon: Icon(Icons.add),
              label: Text('Add'),
              onPressed: () => print('test'),
            ),
            FlatButton(
              color: Colors.brown,
              onPressed: () => Navigator.pushNamed(context, '/login'),
              child: Text('Login', style: Theme.of(context).textTheme.display1),
            ),
            FlatButton(
              color: Colors.grey,
              onPressed: () => Navigator.pushNamed(context, '/todo'),
              child: Text('Todo Screen', style: Theme.of(context).textTheme.display1),
            ),
            FlatButton(
              color: Colors.indigo,
              onPressed: () {
                Navigator.pushNamed(context, '/ui');
              },
              child: Text('UI Screen', style: Theme.of(context).textTheme.display1),
            ),
             FlatButton(
              color: Colors.indigo,
              onPressed: () {
                Navigator.pushNamed(context, '/list');
              },
              child: Text('List Screen', style: Theme.of(context).textTheme.display1),
            ),
          ],
        ),
      )
    );
  }
}