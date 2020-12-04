import 'package:mps/app/domain/entity/user/user_entity.dart';

abstract class UserRepository {
  Future<void> save(UserEntity user);
  Future<void> remove(UserEntity user);
}
