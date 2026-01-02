import 'package:chatter/core/feuille/failure.dart';
import 'package:chatter/feature/User%20Profile/domain/repository/ProfileRepository%20.dart';
import 'package:dartz/dartz.dart';

class UploadProfilePictureUseCase {
  final ProfileRepository repository;
  UploadProfilePictureUseCase(this.repository);
  Future<Either<Failure, Unit>> call(String userId, String imagePath) {
    return repository.uploadProfilePicture(userId, imagePath);
  }
}
