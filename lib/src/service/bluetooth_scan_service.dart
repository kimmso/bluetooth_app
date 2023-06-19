import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter_bluetooth_app/src/constants/flutter_blue_const.dart';
import 'package:flutter_bluetooth_app/src/model/device_model.dart';

class BluetoothScanService {
  static Stream<List<DeviceModel>> getDevices() {
    flutterBlue.startScan(timeout: const Duration(seconds: 5));
    return flutterBlue.scanResults.map((results) {
      if (results.isEmpty) {
        print('Error');
      }
      List<DeviceModel> devices = [];
      for (ScanResult result in results) {
        final device = DeviceModel.fromScan(result);
        devices.add(device);
      }
      return devices;
    });
  }
}
