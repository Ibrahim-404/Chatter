import 'package:chatter/core/function/permission_menager.dart';
import 'package:chatter/feature/User%20Profile/domain/enums/image_source_type.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionMenagerImplemant implements ManagePermission {
  @override
  Future<bool> requestPermission(ImageSourceType source) async {
    final  permissionToRequest = source == ImageSourceType.camera
        ? Permission.camera
        : Permission.storage;
    if (await permissionToRequest.isGranted) {
      return true;
    }
    final status = await permissionToRequest.request();
    return status.isGranted;
  }
}
