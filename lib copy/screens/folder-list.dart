import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart.dart';
import '../models/user.dart';

void refreshFolder (context) {
  print('TODO');
  var userModel = Provider.of<UserModel>(context);
  print('asd ${userModel.authToken}');
}

class FolderList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _MyAppBar(),
          SliverToBoxAdapter(child: SizedBox(height: 12)),
          SliverList(
              delegate:
                  SliverChildBuilderDelegate((_, index) => _MyListItem(index))),
        ],
      ),
    );
  }
}

class _AddButton extends StatelessWidget {
  final Item item;

  const _AddButton({Key key, @required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var cart = Provider.of<CartModel>(context);

    return Icon(Icons.check_box);
    // return FlatButton(
    //   onPressed: cart.items.contains(item) ? null : () => cart.add(item),
    //   splashColor: Theme.of(context).primaryColor,
    //   child: cart.items.contains(item)
    //       ? Icon(Icons.check, semanticLabel: 'ADDED')
    //       : Text('ADD'),
    // );
  }
}

class _MyAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text('Folder', style: Theme.of(context).textTheme.display2),
      floating: true,
      actions: [
        IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () => refreshFolder(context)),
        IconButton(
            icon: Icon(Icons.menu),
            onPressed: () => Navigator.pushNamed(context, '/cart')),
        IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () => Navigator.pushNamed(context, '/')),
      ],
    );
  }
}

class _MyListItem extends StatelessWidget {
  final int index;

  _MyListItem(this.index) : super(key: ValueKey(index));

  @override
  Widget build(BuildContext context) {
    var item = Item(index);
    var textTheme = Theme.of(context).textTheme.subhead;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: LimitedBox(
        maxHeight: 48,
        child: Row(
          children: [
            Icon(Icons.insert_drive_file),
            // AspectRatio(
            //   aspectRatio: 1,
            //   child: Container(
            //     color: Colors.primaries[index % Colors.primaries.length],
            //   ),
            // ),
            SizedBox(width: 24),
            Expanded(
              child: Text(item.name, style: textTheme),
            ),
            SizedBox(width: 24),
            // Icon(Icons.folder),
            // Icon(Icons.note_add),
            // Icon(Icons.add),
            // Icon(Icons.create_new_folder),
            _AddButton(item: item),
            
          ],
          // onTap: () {
          //   print('asd');
          // }
        ),
      ),
    );
  }
}
