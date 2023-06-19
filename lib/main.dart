import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_app/src/binding/init_binding.dart';
import 'package:get/get.dart';

import 'src/app.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Bluetooth Countboard',
      home: const App(),
      initialBinding: InitBinding(),
    );
  }
}
