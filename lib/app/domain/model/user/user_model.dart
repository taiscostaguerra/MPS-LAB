import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserModel {
  @HiveField(0)
  String id;

  @HiveField(1)
  String login;

  @HiveField(2)
  String password;

  UserModel({this.login, this.password});

  @override
  bool operator ==(other) {
    final user = other as UserModel;
    return user.login == this.login && user.password == this.password;
  }
}
