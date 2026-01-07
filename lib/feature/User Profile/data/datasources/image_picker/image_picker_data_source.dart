import 'package:chatter/feature/User%20Profile/domain/enums/image_source_type.dart';

abstract class ImagePickerDataSource {
  Future<String> pickImage(ImageSourceType source);
}