import 'package:flutter/material.dart';
import 'package:mps/app/login/domain/exception/login_exception.dart';
import 'package:mps/app/login/domain/model/user/user_model.dart';
import 'package:mps/app/login/domain/repository/user_repository.dart';
import 'package:mps/app/login/domain/validator/user_validator.dart';

class LoginController with UserValidator {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final loginController = TextEditingController();
  final passwordController = TextEditingController();
  final UserRepository userRepository;

  LoginController(this.userRepository);

  void save(Function(String) callback, Function(String) success) async {
    try {
      if (formKey.currentState.validate()) {
        final user = UserModel(
            login: loginController.text, password: passwordController.text);
        await userRepository.save(user);
        success("Usuário ${user.login} salvo com sucesso");
      }
    } on LoginException catch (e) {
      callback(e.message);
    }
  }

  void remove(Function(String) callback, Function(String) success) async {
    try {
      if (formKey.currentState.validate()) {
        final user = UserModel(
            login: loginController.text, password: passwordController.text);
        await userRepository.remove(user);
        success("Usuário ${user.login} removido com sucesso");
      }
    } on LoginException catch (e) {
      callback(e.message);
    }
  }
}
