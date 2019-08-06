import 'package:flutter/material.dart';
// import 'package:flutter_mobx/flutter_mobx.dart';
import '../store/main.dart';

class UiScreen extends StatelessWidget {
  final MainStore mainStore = SingletonStore.instance;

  @override
  Widget build(BuildContext context) {
    final List<String> entries = <String>['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L'];
    final List<int> colorCodes = <int>[600, 500, 400, 300, 200, 100, 200, 100, 200, 100, 200, 100];

    return Scaffold(
        appBar: AppBar(
          title: Text('UI  Screen', style: Theme.of(context).textTheme.display2),
          actions: [
            IconButton(
                icon: Icon(Icons.menu),
                onPressed: () => Navigator.pushNamed(context, '/cart')),
            IconButton(
                icon: Icon(Icons.exit_to_app),
                onPressed: () => Navigator.pushNamed(context, '/')),
          ],
        ),
        body: ListView.builder(
          itemCount: entries.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 50,
              color: Colors.amber[colorCodes[index]],
              child: Center(child: Text('Entry ${entries[index]}')),
            );
          }
        ),
      // child: ListView.builder(
      //   padding: const EdgeInsets.all(8.0),
      //   itemCount: entries.length,
      //   itemBuilder: (BuildContext context, int index) {
      //     return Container(
      //       height: 50,
      //       color: Colors.amber[colorCodes[index]],
      //       child: Center(child: Text('Entry ${entries[index]}')),
      //     );
      //   }
      // ),
      // // child: ListView(
      //       padding: const EdgeInsets.all(8.0),
      //       children: <Widget>[
      //         Text('Entry A'),
      //         Container(
      //           height: 50,
      //           color: Colors.amber[600],
      //           child: const Center(child: Text('Entry A')),
      //         ),
      //         Container(
      //           height: 50,
      //           color: Colors.amber[500],
      //           child: const Center(child: Text('Entry B')),
      //         ),
      //         Container(
      //           height: 50,
      //           color: Colors.amber[100],
      //           child: const Center(child: Text('Entry C')),
      //         ),
      //       ],адг
      //     ),


//       CustomScrollView(
//   slivers: <Widget>[
//     const SliverAppBar(
//       pinned: true,
//       expandedHeight: 250.0,
//       flexibleSpace: FlexibleSpaceBar(
//         title: Text('Demo'),
//       ),
//     ),
//     SliverGrid(
//       gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//         maxCrossAxisExtent: 200.0,
//         mainAxisSpacing: 10.0,
//         crossAxisSpacing: 10.0,
//         childAspectRatio: 4.0,
//       ),
//       delegate: SliverChildBuilderDelegate(
//         (BuildContext context, int index) {
//           return Container(
//             alignment: Alignment.center,
//             color: Colors.teal[100 * (index % 9)],
//             child: Text('grid item $index'),
//           );
//         },
//         childCount: 20,
//       ),
//     ),
//     SliverFixedExtentList(
//       itemExtent: 50.0,
//       delegate: SliverChildBuilderDelegate(
//         (BuildContext context, int index) {
//           return Container(
//             alignment: Alignment.center,
//             color: Colors.lightBlue[100 * (index % 9)],
//             child: Text('list item $index'),
//           );
//         },
//       ),
//     ),
//   ],
// )
    );
  }
}
