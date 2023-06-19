import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_app/src/baseball_count_app.dart';
import 'package:flutter_bluetooth_app/src/controller/bluetooth_controller.dart';
import 'package:get/get.dart';

class App extends GetView<BluetoothController> {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('스캔!');
          controller.scan();
        },
        child: const Icon(Icons.search),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text("202316711 김소연"),
        titleTextStyle: const TextStyle(color: Colors.black, fontSize: 24),
        elevation: 0.0,
      ),
      body: Obx(
        () => ListView.builder(
            itemCount: controller.devices.length,
            itemBuilder: (_, index) {
              final device = controller.devices[index];
              return ListTile(
                onTap: () {
                  device.device!.connect();
                  print('연결');
                  Get.to(() => BaseballCount(deviceModel: device));
                },
                title: Text((device.name == '') ? 'N/A' : device.name),
              );
            }),
      ),
    );
  }
}
