import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:mps/app/login/domain/controller/login_controller.dart';
import 'package:mps/app/login/infra/repository/user_repository_impl.dart';
import 'package:mps/app/login/view/login_view.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => LoginController(
        UserRepositoryImpl(
          Hive.box("users"),
        ),
      ),
      builder: (_, child) => LoginView(),
      child: LoginView(),
    );
  }
}
