import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:newsapp/Features/Home/Presentation/Views_models/News_cubit/news_cubit_cubit.dart';
import 'package:newsapp/Features/Home/data/Repo/RepoNews.dart';
import 'package:newsapp/Features/Home/data/Services/Api_Networking.dart';

final getIt = GetIt.instance;

void initGitIt() {
  getIt.registerLazySingleton<NewsCubitCubit>(()=> NewsCubitCubit(getIt()));
  getIt.registerLazySingleton<Reponews>(()=> Reponews(getIt()));
  getIt.registerLazySingleton<Api_Networking>(()=> Api_Networking(createAndSetupDio()));


}
Dio createAndSetupDio() {
  Dio dio = Dio();

  // Set timeouts using Duration
  dio.options.connectTimeout = Duration(seconds: 20); // Connection timeout
  dio.options.receiveTimeout = Duration(seconds: 10); // Response timeout

  // Add logging interceptor for development purposes
  dio.interceptors.add(LogInterceptor(
    request: true,
    requestBody: true,
    requestHeader: false,
    responseBody: true,
    responseHeader: false,
    error: true,
  ));

  return dio;
}
