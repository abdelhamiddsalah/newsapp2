import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:newsapp/Core/Services/Api_Networking.dart';
import 'package:newsapp/Features/detailsFeature/logic/cart_cubit/cartcubit_cubit.dart';
import 'package:newsapp/Features/detailsFeature/logic/details_cubit/details_cubit_cubit.dart';
import 'package:newsapp/Features/homeFeature/data/repos/Repo/RepoNews.dart';
import 'package:newsapp/Features/homeFeature/logic/News_cubit/news_cubit_cubit.dart';
import 'package:newsapp/Features/homeFeature/logic/theme_cubit/theme_cubit_cubit.dart';

final getIt = GetIt.instance;

void initGitIt() {
  getIt.registerLazySingleton<Api_Networking>(() => Api_Networking(createAndSetupDio()));
  getIt.registerLazySingleton<Reponews>(() => Reponews(getIt<Api_Networking>()));
  getIt.registerLazySingleton<NewsCubitCubit>(() => NewsCubitCubit(getIt<Reponews>()));
  getIt.registerLazySingleton<ThemeCubitCubit>(() => ThemeCubitCubit());
  getIt.registerLazySingleton<CartCubit>(() => CartCubit());
  getIt.registerLazySingleton<DetailsCubitCubit>(() => DetailsCubitCubit());
}


Dio createAndSetupDio() {
  Dio dio = Dio();

  dio.options.connectTimeout = Duration(seconds: 20);
  dio.options.receiveTimeout = Duration(seconds: 10);

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