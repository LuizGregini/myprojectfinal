import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myprojectfinal/models/user.dart';
import 'package:myprojectfinal/provider/users.dart';
import 'package:myprojectfinal/routes/app_routes.dart';
import 'package:provider/provider.dart';

class UserTile extends StatelessWidget {
  //const UserTile({super.key});
  final User user;
  const UserTile(this.user);

  //get icon => null;

  @override
  Widget build(BuildContext context) {
    final avatar = user.avatarUrl.isEmpty
      ? const CircleAvatar(child: Icon(Icons.person))
      : CircleAvatar(backgroundImage: NetworkImage(user.avatarUrl));
    return ListTile(
      leading: avatar,
      title: Text(user.name),
      subtitle: Text(user.email),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              color: Colors.orange,
              icon: const Icon(Icons.edit),
              onPressed: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.USER_FORM,
                  arguments: user,
                );
              },
            ),
            IconButton(
              color: Colors.red,
              icon: const Icon(Icons.delete),
              onPressed: () {
                showDialog(
                    context: context,
                  builder: (ctx) => AlertDialog(
                    title: Text('Excluir Usuário'),
                    content: Text('Tem certeza?'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: (){
                          Navigator.of(context).pop();
                        },
                        child: Text('Não'),
                      ),
                      TextButton(
                        child: Text('Sim'),
                        onPressed: (){
                          Provider.of<Users>(context, listen: false).remove(user);
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
