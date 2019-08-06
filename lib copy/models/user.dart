// import 'dart:collection';

import 'package:flutter/foundation.dart';

// const _itemNames = [
//   'Code Smell',
//   'Control Flow',
//   'Interpreter',
//   'Recursion',
//   'Sprint',
//   'Heisenbug',
//   'Spaghetti',
//   'Hydra Code',
//   'Off-By-One',
//   'Scope',
//   'Callback',
//   'Closure',
//   'Automata',
//   'Bit Shift',
//   'Currying',
// ];

class UserModel extends ChangeNotifier {
  String authToken = '';
  String email = '';
  /// Internal, private state of the cart.
  // final List<Item> _items = [];

  /// An unmodifiable view of the items in the cart.
  // UnmodifiableListView<Item> get items => UnmodifiableListView(_items);

  /// The current total price of all items (assuming all items cost $1).
  // bool get isAuthorised => authToken !== '';

  /// Adds [item] to cart. This is the only way to modify the cart from outside.
  void populate(data) {
    // print('populate ${data}');
    // _items.add(item);
    // This line tells [Model] that it should rebuild the widgets that
    // depend on it.
    // print(data['AuthToken']);
    // if (data['AuthToken']) {
      authToken = data['AuthToken'];
    // }
    
    print('update');
    notifyListeners();
  }
}

// @immutable
// class Item {
//   final int id;
//   final String name;

//   final String authToken;
//   final String email;

//   Item(this.id) : name = _itemNames[id % _itemNames.length];

//   @override
//   int get hashCode => id;

//   @override
//   bool operator ==(other) => other is Item && other.id == id;
// }
