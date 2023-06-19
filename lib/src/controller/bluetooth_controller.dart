import 'dart:convert';

import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter_bluetooth_app/src/model/device_model.dart';
import 'package:flutter_bluetooth_app/src/service/bluetooth_scan_service.dart';
import 'package:get/get.dart';

class BluetoothController extends GetxController {
  final Rx<List<DeviceModel>> _devices = Rx<List<DeviceModel>>([]);
  final Rx<BluetoothState> _state = Rx<BluetoothState>(BluetoothState.unknown);

  List<DeviceModel> get devices => _devices.value;

  @override
  void onInit() {
    super.onInit();
    _state.bindStream(FlutterBluePlus.instance.state);
  }

  void scan() {
    // if (_state.value == BluetoothState.on) {
    _devices.bindStream(BluetoothScanService.getDevices());
    print(_devices);
    // }
  }

  void sendData(BluetoothDevice device, String data) async {
    Guid serviceUuid = Guid("4fafc201-1fb5-459e-8fcc-c5c9c331914b");
    Guid characteristicUuid = Guid("beb5483e-36e1-4688-b7f5-ea07361b26a8");

    List<BluetoothService> services = await device.discoverServices();
    BluetoothService service =
        services.firstWhere((s) => s.uuid == serviceUuid);
    BluetoothCharacteristic characteristic =
        service.characteristics.firstWhere((c) => c.uuid == characteristicUuid);

    List<int> value = utf8.encode(data);

    try {
      await characteristic.write(value);
      print("Data sent successfully");
    } catch (e) {
      print("Error");
    }
  }
}
