import 'dart:math';

import 'package:crud/data/dummy.users.dart';
import 'package:crud/models/user.dart';
import 'package:flutter/material.dart';

class Users with ChangeNotifier {
  Map<String, User> _items = {...DUMMY_USERS};

  List<User> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  User byIndex(int i) {
    return _items.values.elementAt(i);
  }

  put(User user) {
    if (user == null) {
      return;
    }
    print(_items.containsKey(user.id));
    if (_items.containsKey(user.id)) {
      _items.update(user.id, (_) => user);
      return notifyListeners();
    }

    final id = Random().nextDouble().toString();

    _items.putIfAbsent(
      id,
      () => User(
          name: user.name,
          email: user.email,
          avatarUrl: user.avatarUrl,
          id: id),
    );

    return notifyListeners();
  }

  remove(String id) {
    if (id == null) {
      return;
    }

    _items.remove(id);

    return notifyListeners();
  }
}
