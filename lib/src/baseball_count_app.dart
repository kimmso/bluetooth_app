import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_app/src/controller/bluetooth_controller.dart';
import 'package:flutter_bluetooth_app/src/model/device_model.dart';
import 'package:get/get.dart';

class BaseballCount extends StatelessWidget {
  final DeviceModel deviceModel;
  const BaseballCount({super.key, required this.deviceModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                Get.find<BluetoothController>()
                    .sendData(deviceModel.device!, "Strike");
              },
              child: const Text("Strike")),
          ElevatedButton(
              onPressed: () {
                Get.find<BluetoothController>()
                    .sendData(deviceModel.device!, "Ball");
              },
              child: const Text("Ball")),
          ElevatedButton(
              onPressed: () {
                Get.find<BluetoothController>()
                    .sendData(deviceModel.device!, "Out");
              },
              child: const Text("Out")),
        ],
      )),
    );
  }
}
