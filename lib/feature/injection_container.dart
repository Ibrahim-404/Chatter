import 'package:chatter/core/database/database_helper.dart';
import 'package:chatter/core/network/network_checker_implemant.dart';
import 'package:chatter/feature/Authentication/data/repository/Auth_Repo_dataLayer.dart';
import 'package:chatter/feature/Authentication/domain/repository/domain_auth_repo.dart';
import 'package:chatter/feature/Authentication/presentation/manager/auht_bloc/bloc/send_varify_bloc.dart';
import 'package:chatter/feature/User%20Profile/presentation/controllers/profile_picture_bloc/bloc/profile_picture_bloc.dart';
import 'package:chatter/feature/User%20Profile/presentation/controllers/user_profile_bloc/bloc/mange_user_profile_bloc.dart';
// import 'package:chatter/feature/Authentication/presentation/manager/auht_bloc/validation/bloc/validation_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';

final sl = GetIt.instance;
Future<void> init() async {
  sl.registerLazySingleton(
    () => NetworkCheckerImplemant(connectionChecker: sl()),
  );
  sl.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());
  sl.registerLazySingleton<AuthRepo>(() => AuthRepoDataLayer());
  sl.registerFactory(() => SendVarifyBloc(authRepo: sl()));
  // sl.registerLazySingleton(() => NetworkCheckerImplemant(connectionChecker: sl()));
  sl.registerLazySingleton(() => ImagePicker());
  sl.registerLazySingleton(() => ProfilePictureBloc(sl()));
  sl.registerLazySingleton(() => MangeUserProfileBloc(sl(), sl(), sl()));
  // sl.registerFactory(() => ValidationBloc());
}
