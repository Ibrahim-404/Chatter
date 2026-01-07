import 'package:chatter/feature/User%20Profile/domain/enums/image_source_type.dart';

abstract class ManagePermission {
  Future<bool> requestPermission(ImageSourceType permission);
}
