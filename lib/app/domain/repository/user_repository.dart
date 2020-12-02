import 'package:mps/app/domain/model/user/user_model.dart';

abstract class UserRepository {
  Future<void> save(UserModel user);
  Future<void> remove(UserModel user);
}
