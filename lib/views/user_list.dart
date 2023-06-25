import 'package:flutter/material.dart';
import 'package:myprojectfinal/components/user_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:myprojectfinal/provider/users.dart';
import 'package:myprojectfinal/routes/app_routes.dart';
import 'package:provider/provider.dart';


class UserList extends StatelessWidget {
  // const UserList({super.key});
  @override
  Widget build(BuildContext context) {
    //final users = {...DUMMY_USERS};
    final Users users = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Usuários'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(
                AppRoutes.USER_FORM
              );
              //users.remove(users.byIdex(0));
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: users.count,
        itemBuilder: (ctx, i) =>
            UserTile(users.byIdex(i)),
      ),
    );
  }
}






