import 'package:flutter/material.dart';
import 'package:mps/app/login/login.dart';
import 'package:mps/app/shared/utils/app_utils.dart';

void main() async {
  await AppUtils.init();
  runApp(MaterialApp(
    home: Login(),
  ));
}
