import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_app/src/controller/bluetooth_controller.dart';
import 'package:get/get.dart';

class App extends GetView<BluetoothController> {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: controller.scan,
        child: Icon(Icons.search),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("202316711 김소연"),
        titleTextStyle: TextStyle(color: Colors.black, fontSize: 24),
        elevation: 0.0,
      ),
      body: Obx(
        () => ListView.builder(
            itemCount: controller.devices.length,
            itemBuilder: (_, index) {
              final device = controller.devices[index];
              return ListTile(
                title: Text(device.name),
              );
            }),
      ),
    );
  }
}
