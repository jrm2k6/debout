import 'dart:async';
import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserService {

  static Future<String> getDeviceId() async {
    final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    if (Platform.isIOS) {
      IosDeviceInfo deviceData = await deviceInfoPlugin.iosInfo;
      return deviceData.identifierForVendor;
    }

    return null;
  }
  static Future<void> saveNotificationToken(String token) async {
    String deviceId = await getDeviceId();

    if (deviceId != null) {
      Firestore.instance.collection('users').document(deviceId).setData({
        'notifications_token': token
      });
    }

  }
}