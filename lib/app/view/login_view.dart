import 'package:flutter/material.dart';
import 'package:mps/app/presentation/controller/controller.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  Controller controller;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  _showError(String message) {
    controller.scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: Colors.red,
    ));
  }

  _success(String message) {
    controller.scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: Colors.green,
    ));
  }

  @override
  Widget build(BuildContext context) {
    controller = Provider.of<Controller>(context);
    return Scaffold(
      key: controller.scaffoldKey,
      appBar: AppBar(
        title: Text("Adicionar usuário"),
      ),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              TextFormField(
                controller: controller.loginController,
                decoration: InputDecoration(
                  labelText: "Digite seu login",
                ),
                validator: controller.validateLogin,
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: controller.passwordController,
                decoration: InputDecoration(
                  labelText: "Digite sua senha",
                ),
                obscureText: true,
                validator: controller.validatePassword,
              ),
              SizedBox(height: 16),
              RaisedButton(
                onPressed: () => controller.saveUser(_showError, _success),
                child: Text("Adicionar"),
              ),
              RaisedButton(
                onPressed: () => controller.removeUser(_showError, _success),
                child: Text("Remover"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
