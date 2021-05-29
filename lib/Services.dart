import 'dart:convert';

import 'package:flutter/services.dart';

import 'User.dart';

class Services {
  static Future<List<User>> getAllEmployees() async {
    String rawJson = await rootBundle.loadString('assets/employees.json');
    List data = await jsonDecode(rawJson);
    Map<String, User> usersMap = {};
    List<User> users = [];
    data.forEach((element) {
      User user = User.fromJson(element);
      usersMap[user.firstName] = user;
    });
//Alphabetical sort
    List temp = usersMap.keys.toList()..sort();
    temp.forEach((element) {
      users.add(usersMap[element]);
    });
    return users;
  }
}
