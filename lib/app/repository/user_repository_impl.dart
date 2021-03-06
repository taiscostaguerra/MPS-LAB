import 'package:hive/hive.dart';
import 'package:mps/app/domain/entity/user/user_entity.dart';
import 'package:mps/app/domain/exception/login_exception.dart';
import 'package:mps/app/domain/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final Box box;

  UserRepositoryImpl(this.box);

  @override
  Future<void> save(UserEntity user) async {
    try {
      final result = box.get(user.login) as UserEntity;
      if (result == null) {
        await box.put(user.login, user);
      } else {
        throw ("Usuário já existe");
      }
    } catch (e) {
      throw (LoginException(e));
    }
  }

  @override
  Future<void> remove(UserEntity user) async {
    try {
      final result = box.get(user.login) as UserEntity;
      if (result != null && user == result) {
        await box.delete(user.login);
      } else {
        throw ("Usuário não existe");
      }
    } catch (e) {
      throw (LoginException(e.toString()));
    }
  }
}
