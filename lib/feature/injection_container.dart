import 'package:chatter/core/database/database_helper.dart';
import 'package:chatter/core/network/network_checker.dart';
import 'package:chatter/core/network/network_checker_implemant.dart';
import 'package:chatter/feature/Authentication/data/repository/Auth_Repo_dataLayer.dart';
import 'package:chatter/feature/Authentication/domain/repository/domain_auth_repo.dart';
import 'package:chatter/feature/Authentication/presentation/manager/auht_bloc/bloc/send_varify_bloc.dart';
import 'package:chatter/feature/Chats%20List/data/datasource/localDataRource/chat_list_local_data_source.dart';
import 'package:chatter/feature/Chats%20List/data/datasource/localDataRource/chat_list_local_data_source_imp.dart';
import 'package:chatter/feature/Chats%20List/data/datasource/remoteDataRource/chat_list_remote_data_source.dart';
import 'package:chatter/feature/Chats%20List/data/datasource/remoteDataRource/chat_list_remote_data_source_imp.dart';
import 'package:chatter/feature/User%20Profile/presentation/controllers/profile_picture_bloc/bloc/profile_picture_bloc.dart';
import 'package:chatter/feature/User%20Profile/presentation/controllers/user_profile_bloc/bloc/mange_user_profile_bloc.dart';
// import 'package:chatter/feature/Authentication/presentation/manager/auht_bloc/validation/bloc/validation_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final sl = GetIt.instance;
Future<void> init() async {
  // Eternal packages
  sl.registerLazySingleton<SupabaseClient>(() => Supabase.instance.client);
  sl.registerLazySingleton<InternetConnectionChecker>(
    () => InternetConnectionChecker.createInstance(),
  );
  sl.registerLazySingleton(() => ImagePicker());
  // Core
  sl.registerLazySingleton<NetworkChecker>(
    () => NetworkCheckerImplemant(
      connectionChecker: sl<InternetConnectionChecker>(),
    ),
  );
  sl.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());
  sl.registerLazySingleton<ChatListRemoteDataSource>(
    () => ChatListRemoteDataSourceImp(sl<SupabaseClient>()),
  );
  sl.registerLazySingleton<ChatListLocalDataSource>(
    () => ChatListLocalDataSourceImp(databaseHelper: sl<DatabaseHelper>()),
  );

  // feature - Auth
  sl.registerLazySingleton<AuthRepo>(() => AuthRepoDataLayer());
  sl.registerFactory(() => SendVarifyBloc(authRepo: sl()));
  // feature - User Profile

  // feature - Chats List

  sl.registerLazySingleton(() => ProfilePictureBloc(sl()));
  sl.registerLazySingleton(() => MangeUserProfileBloc(sl(), sl(), sl()));
}
