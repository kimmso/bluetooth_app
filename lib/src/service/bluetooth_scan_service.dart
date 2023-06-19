import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter_bluetooth_app/src/model/device_model.dart';

class BluetoothScanService {
  static Stream<List<DeviceModel>> getDevices() {
    FlutterBluePlus flutterBlue = FlutterBluePlus.instance;
    flutterBlue.scan(timeout: Duration(seconds: 5));
    return flutterBlue.scanResults.map((results) {
      List<DeviceModel> devices = [];
      for (ScanResult result in results) {
        final device = DeviceModel.fromScanResult(result);
        devices.add(device);
      }
      return devices;
    });
  }
}
