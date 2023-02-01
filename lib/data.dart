import 'package:hydrate_bloc_example/models.dart';

class Data {
  List<User> get users {
    return const [
      User(id: "1111", name: "User 1", username: "User 1"),
      User(id: "2222", name: "User 2", username: "User 2"),
      User(id: "3333", name: "User 3", username: "User 3"),
      User(id: "4444", name: "User 4", username: "User 4"),
    ];
  }
}
