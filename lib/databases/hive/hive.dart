import 'dart:convert';
import 'package:hive/hive.dart';

import '../../models/user_model/user_model.dart';

class Keys {
  static const users = 'cat_facts_model';
}

class UserDB {

  static final _userBox = Hive.box(Keys.users);

  static Future<UserDB> getInstance() async {
    await Hive.openBox(Keys.users);
    return UserDB();
  }

  static void put(UserModel value) {
    final json = jsonEncode(value);
    _userBox.add(json);
  }

  static List<UserModel> get() {
    final values = _userBox.values;
    return values
        .map((e) => UserModel.fromJson(json.decode(e.toString())))
        .toList();
  }

  static void delete() {
    _userBox.deleteAll(_userBox.keys);
  }


  static void openBox() async {
    await Hive.openBox(Keys.users);
  }

  static void closeBox() async {
    await Hive.close();
  }
}
