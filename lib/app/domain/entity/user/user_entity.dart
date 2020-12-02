import 'package:hive/hive.dart';

part 'user_entity.g.dart';

@HiveType(typeId: 0)
class UserEntity {
  @HiveField(0)
  String id;

  @HiveField(1)
  String login;

  @HiveField(2)
  String password;

  UserEntity({this.login, this.password});

  @override
  bool operator ==(other) {
    final user = other as UserEntity;
    return user.login == this.login && user.password == this.password;
  }
}
