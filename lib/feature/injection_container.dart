import 'package:chatter/feature/Authentication/data/repository/Auth_Repo_dataLayer.dart';
import 'package:chatter/feature/Authentication/domain/repository/domain_auth_repo.dart';
import 'package:chatter/feature/Authentication/presentation/manager/auht_bloc/bloc/send_varify_bloc.dart';
// import 'package:chatter/feature/Authentication/presentation/manager/auht_bloc/validation/bloc/validation_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;
Future<void> init() async {
  sl.registerLazySingleton<AuthRepo>(() => AuthRepoDataLayer());
  sl.registerFactory(() => SendVarifyBloc(authRepo: sl()));
  // sl.registerFactory(() => ValidationBloc());
}
