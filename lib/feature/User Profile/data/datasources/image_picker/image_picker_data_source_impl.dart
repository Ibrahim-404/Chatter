import 'package:chatter/feature/User%20Profile/data/datasources/image_picker/image_picker_data_source.dart';
import 'package:chatter/feature/User%20Profile/domain/enums/image_source_type.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerDataSourceImplementation implements ImagePickerDataSource {
  ImagePickerDataSourceImplementation(this.picker);
  final ImagePicker picker;
  @override
  Future<String> pickImage(ImageSourceType source) async {
    if (source == ImageSourceType.camera) {
      final pickedFile = await picker.pickImage(source: ImageSource.camera);
      return pickedFile?.path ?? '';
    } else {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      return pickedFile?.path ?? '';
    }
  }
}
