import 'package:mps/app/login/domain/model/user/user_model.dart';

abstract class UserRepository {
  Future<void> save(UserModel user);
  Future<void> remove(UserModel user);
}
