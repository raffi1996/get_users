import 'dart:convert';
import 'package:hive/hive.dart';

import '../../models/user_model/user_model.dart';

class Keys {
  static const users = 'users';
}

class UserDB {
  static Future<void> put(UserModel value) async {
    final json = jsonEncode(value);
    await Hive.openBox(Keys.users);
    await Hive.box(Keys.users).add(json);
    if (Hive.isBoxOpen(Keys.users)) {
      await Hive.close();
    }
  }

  static Future<List<UserModel>> get() async {
    await Hive.openBox(Keys.users);
    final values = Hive.box(Keys.users).values;
    if (Hive.isBoxOpen(Keys.users)) {
      await Hive.close();
    }
    return values
        .map((e) => UserModel.fromJson(json.decode(e.toString())))
        .toList();
  }

  static Future<void> delete() async {
    await Hive.openBox(Keys.users);
    await Hive.box(Keys.users).deleteAll(Hive.box(Keys.users).keys);
    if (Hive.isBoxOpen(Keys.users)) {
      await Hive.close();
    }
  }
}
