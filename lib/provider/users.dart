import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:myprojectfinal/data/dummy_users.dart';
import 'package:myprojectfinal/models/user.dart';

class Users with ChangeNotifier{
  final Map<String, User> _items ={...DUMMY_USERS};

  List<User> get all{
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  User byIdex(int i){
    return _items.values.elementAt(i);
  }

  void put(User user){
    if(user == null){
      return;
    }
    if(user != null &&
        user.id.trim().isNotEmpty &&
        _items.containsKey(user.id)){
        _items.update(user.id, (_) => user);
        id: user.id;
        name: user.name;
        email: user.email;
        avatarUrl: user.email;
    } else{
      final id = Random().nextDouble().toString();
      _items.putIfAbsent(id, () => User(
        id: id,
        name: user.name,
        email: user.email,
        avatarUrl: user.avatarUrl,
      ),
      );
    }
    // adiciona
    notifyListeners();
  }

  void remove(User user){
    if(user != null && user.id != null){
      _items.remove(user.id);
      notifyListeners();
    }
  }
}