import 'package:cat_trivia/databases/hive/hive.dart';
import 'package:flutter/material.dart';

import '../models/user_model/user_model.dart';

class HistoryFactsScreen extends StatefulWidget {
  const HistoryFactsScreen({Key? key}) : super(key: key);

  @override
  State<HistoryFactsScreen> createState() => _HistoryFactsScreenState();
}

class _HistoryFactsScreenState extends State<HistoryFactsScreen> {
  List<UserModel> users = [];

  @override
  void initState() {
    super.initState();
    users = UserDB.get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users History'),
      ),
      body: Stack(
        children: [
          ListView.builder(
            padding: const EdgeInsets.only(bottom: 70),
            physics: const BouncingScrollPhysics(),
            itemCount: users.length,
            itemBuilder: (_, index) {
              return ListTile(
                leading: Image.network(
                  users[index].avatar!,
                ),
                title: Text(
                    '${users[index].firstName!} ${users[index].lastName!}'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(users[index].email!),
                    Text(users[index].phoneNumber!),
                  ],
                ),
              );
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(
                left: 24,
                right: 24,
                bottom: MediaQuery.of(context).padding.bottom + 24,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: deleteAll,
                      child: const Text('delete all'),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void deleteAll() {
    UserDB.delete();
    setState(() => users = []);
  }
}
