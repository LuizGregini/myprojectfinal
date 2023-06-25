import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myprojectfinal/models/user.dart';
import 'package:myprojectfinal/provider/users.dart';
import 'package:provider/provider.dart';

class UserForm extends StatelessWidget {
  //const UserForm({super.key});

  final _form = GlobalKey<FormState>();
  final Map<String, dynamic> _formData = {};

  //UserForm({super.key});

  @override
  Widget build(BuildContext context) {

    //final Object? user = ModalRouter.of(context)?.settings.arguments;

    //final Object? user = ModalRoute.of(context)?.settings.arguments;

    void _loadFormData(User user){
      _formData['id'] = user.id;
      _formData['name'] = user.name;
      _formData['email'] = user.email;
      _formData['avatarUrl'] = user.avatarUrl;
    }

    //try{
      final User user = ModalRoute.of(context)?.settings.arguments as User;
      print(user);
    //} catch(e){}
    
    //_loadFormData(user);
      
      _loadFormData(user);



    // print(user);

    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário de Usuário'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: (){
              final isValid = _form.currentState?.validate();
              if(isValid == true){
                _form.currentState?.save();
                Provider.of<Users>(context, listen: false).put(User(
                  id: _formData['id'].toString(),
                  name: _formData['name'].toString(),
                  email: _formData['email'].toString(),
                  avatarUrl: _formData['avatarUrl'].toString(),
                ));
                Navigator.of(context).pop();
              }
            },
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Form(
          key: _form,
          child: Column(
            children: <Widget>[
              TextFormField(
                initialValue: _formData['name'],
                decoration: InputDecoration(labelText: 'Nome'),
                validator: (value){
                  if (value == null || value.trim().isEmpty){
                    return 'Nome Inválido';
                  }
                  if(value.trim().length < 3){
                    return 'O Nome deve possuir ao menos 3 Letras';
                  }
                  if (value.trim().length > 50){
                    return 'O Nome não deve passar de 50 Letras';
                  }
                  return null;
                },
                onSaved: (value) => _formData['name'] = value!,
              ),
              TextFormField(
                initialValue: _formData['email'],
                decoration: InputDecoration(labelText: 'Email'),
                onSaved: (value) => _formData['email'] = value!,
              ),
              TextFormField(
                initialValue: _formData['avatarUrl'],
                decoration: InputDecoration(labelText: 'URL dp Avatar'),
                onSaved: (value) => _formData['avatarUrl'] = value!,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
