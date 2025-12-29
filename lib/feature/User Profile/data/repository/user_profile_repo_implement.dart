// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:chatter/core/network/network_checker.dart';
import 'package:chatter/feature/User%20Profile/data/datasources/localDataScources/user_profile_local_data_source%20.dart';
import 'package:chatter/feature/User%20Profile/data/datasources/remoteDataSources/user_profile_remote_data_source%20.dart';
import 'package:chatter/feature/User%20Profile/data/models/user_profile_model.dart';
import 'package:dartz/dartz.dart';

import 'package:chatter/core/feuille/failure.dart';
import 'package:chatter/feature/User%20Profile/domain/repository/ProfileRepository%20.dart';

class UserProfileRepositoryImplementation implements ProfileRepository {
  final NetworkChecker networkChecker;
  final UserProfileLocalDataSource userProfileLocalDataSource;
  final UserProfileRemoteDataSource userProfileRemoteDataSource;

  UserProfileRepositoryImplementation({
    required this.networkChecker,
    required this.userProfileLocalDataSource,
    required this.userProfileRemoteDataSource,
  });
  @override
  Future<Either<Failure, Unit>> completeUserOnboarding(String userId) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserProfileModel>> getUserProfile(
    String userId,
  ) async {
    if (await networkChecker.isConnected) {
      try {
        final userProfile = await userProfileRemoteDataSource.getUserProfile(
          userId,
        );
        await userProfileLocalDataSource.cacheUserProfile(userProfile);
        return Right(userProfile);
      } on Exception catch (e) {
        return Left(ServerFailure(e.toString()));
      }
    } else {
      try {
        final cachedProfile = await userProfileLocalDataSource
            .getCachedUserProfile(userId);
        return Right(cachedProfile);
      } on Exception catch (e) {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> updateUserProfile(
    String userId,
    Map<String, dynamic> profileData,
  ) {
    // TODO: implement updateUserProfile
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> uploadProfilePicture(
    String userId,
    String imagePath,
  ) {
    // TODO: implement uploadProfilePicture
    throw UnimplementedError();
  }
}
