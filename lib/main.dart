import 'package:flutter/material.dart';
import 'package:mps/app/shared/utils/app_utils.dart';

import 'app/login.dart';

void main() async {
  await AppUtils.init();
  runApp(MaterialApp(
    home: Login(),
  ));
}
