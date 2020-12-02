import 'package:meta/meta.dart';
import 'package:mps/app/data/http/http_error.dart';
import 'package:mps/app/domain/entity/user/user_entity.dart';

class RemoteUserModel {
  final String accessToken;

  RemoteUserModel({@required this.accessToken});

  factory RemoteUserModel.fromJson(Map json) {
    if (!json.containsKey('accessToken')) {
      throw HttpError.invalidData;
    }
    return RemoteUserModel(accessToken: json['accessToken']);
  }

  UserEntity toEntity() => UserEntity();
}