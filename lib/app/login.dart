import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:mps/app/domain/command/add_user_comand.dart';
import 'package:mps/app/presentation/controller/controller.dart';
import 'package:mps/app/repository/user_repository_impl.dart';
import 'package:mps/app/view/login_view.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => Controller(
        UserRepositoryImpl(
          Hive.box("users"),
        ),
        null,
        null,
        AddAddressComand(null)
      ),
      builder: (_, child) => LoginView(),
      child: LoginView(),
    );
  }
}
