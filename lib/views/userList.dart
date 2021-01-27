import 'package:crud/components/userTile.dart';
import 'package:crud/provider/users.dart';
import 'package:crud/routes/app.routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Users usersData = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Usuários'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.USER_FORM);
              }),
        ],
      ),
      body: ListView.builder(
        itemCount: usersData.count,
        itemBuilder: (ctx, i) => UserTile(usersData.byIndex(i)),
      ),
    );
  }
}
