import 'package:flutter_bluetooth_app/src/model/device_model.dart';

import '../../constants/flutter_blue_const.dart';

class BluetoothApi {
  static Stream<List<DeviceModel>> getDevices() {
    flutterBlue.startScan(timeout: const Duration(seconds: 4));
    return flutterBlue.scanResults.map((results) {
      List<DeviceModel> devices = [];
      for (var result in results) {
        // if (result.device.name == 'LED BLE MESH SERVER') {
        final device = DeviceModel.fromScan(result);
        devices.add(device);
        // }
      }
      return devices;
    });
  }

  static Future<List<DeviceModel>> getConnectedDevices() async {
    return flutterBlue.connectedDevices.then((connects) {
      List<DeviceModel> devices = [];
      for (var connect in connects) {
        final device = DeviceModel.fromAlreadyConnect(connect);
        devices.add(device);
      }
      return devices;
    });
  }

  static Future<void> connectDevice(DeviceModel deviceModel) async {
    await deviceModel.device!.connect();
  }

  static Future<void> disconnect(DeviceModel deviceModel) async {
    await deviceModel.device!.disconnect();
  }
}
