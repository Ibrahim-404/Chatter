import 'package:chatter/core/network/network_checker.dart';
import 'package:chatter/feature/User%20Profile/data/datasources/image_picker/image_picker_data_source.dart';
import 'package:chatter/feature/User%20Profile/data/datasources/localDataScources/user_profile_local_data_source%20.dart';
import 'package:chatter/feature/User%20Profile/data/datasources/remoteDataSources/user_profile_remote_data_source%20.dart';
import 'package:chatter/feature/User%20Profile/data/models/mappers/user_profile_model_mapper.dart';
import 'package:chatter/feature/User%20Profile/domain/entities/user_prtofile_entity.dart';
import 'package:chatter/feature/User%20Profile/domain/enums/image_source_type.dart';
import 'package:dartz/dartz.dart';

import 'package:chatter/core/feuille/failure.dart';
import 'package:chatter/feature/User%20Profile/domain/repository/ProfileRepository%20.dart';

class UserProfileRepositoryImplementation implements ProfileRepository {
  final NetworkChecker networkChecker;
  final UserProfileLocalDataSource userProfileLocalDataSource;
  final UserProfileRemoteDataSource userProfileRemoteDataSource;
  final ImagePickerDataSource imagePickerDataSource;

  UserProfileRepositoryImplementation({
    required this.networkChecker,
    required this.userProfileLocalDataSource,
    required this.userProfileRemoteDataSource,
    required this.imagePickerDataSource,
  });
  @override
  Future<Either<Failure, Unit>> completeUserOnboarding(String userId) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserProfileEntity>> getUserProfile(
    String userId,
  ) async {
    if (await networkChecker.isConnected) {
      try {
        final userProfile = await userProfileRemoteDataSource.getUserProfile(
          userId,
        );
        await userProfileLocalDataSource.cacheUserProfile(userProfile);
        return Right(userProfile.toEntity());
      } on Exception catch (e) {
        return Left(ServerFailure(e.toString()));
      }
    } else {
      try {
        final cachedProfile = await userProfileLocalDataSource
            .getCachedUserProfile(userId);
        return Right(cachedProfile.toEntity());
      } on Exception catch (e) {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> updateUserProfile(
    String userId,
    Map<String, dynamic> profileData,
  ) async {
    if (await networkChecker.isConnected) {
      try {
        await userProfileRemoteDataSource.editUserProfile(userId, profileData);
        return Right(unit);
      } on Exception catch (e) {
        return Left(ServerFailure(e.toString()));
      }
    } else {
      return Left(NetworkFailure());
    }
  } 

  @override
  Future<Either<Failure, Unit>> uploadProfilePicture(
    String userId,
    ImageSourceType source,
  ) async {
    if (await networkChecker.isConnected) {
      try {
        final imagePath = await imagePickerDataSource.pickImage(source);
        final imageUrl = await userProfileRemoteDataSource
            .updateUserProfilePicture(userId, imagePath);
        return Right(unit);
      } on Exception catch (e) {
        return Left(ServerFailure(e.toString()));
      }
    } else {
      return Left(NetworkFailure());
    }
  }
}
