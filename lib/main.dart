import 'package:flutter/material.dart';
import 'package:myprojectfinal/provider/users.dart';
import 'package:myprojectfinal/routes/app_routes.dart';
import 'package:myprojectfinal/views/user_form.dart';
import 'package:myprojectfinal/views/user_list.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Users(),
      ),
    ],
      child: MaterialApp(
        title: 'Hello World',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          //colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          //useMaterial3: true,
        ),
        //home: UserList(),
        routes:{
          AppRoutes.HOME: (_) => UserList(),
          AppRoutes.USER_FORM: (_) => UserForm(),
        },
      ),
    );
  }
}
