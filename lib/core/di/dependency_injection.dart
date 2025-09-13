import 'package:car_rental_app/core/network/dio_factory.dart';
import 'package:car_rental_app/features/auth/login/data/api/api_login_service.dart';
import 'package:car_rental_app/features/auth/login/data/repo_impl/login_repo_implementation.dart';
import 'package:car_rental_app/features/auth/login/domain/repo/login_repo_domain.dart';
import 'package:car_rental_app/features/auth/login/domain/use_cases/login_use_cases.dart';
import 'package:car_rental_app/features/auth/login/presentation/cubit/login_cubit.dart';
import 'package:car_rental_app/features/auth/sign_up/data/api/api_sign_up_service.dart';
import 'package:car_rental_app/features/auth/sign_up/data/repo_impl/sign_up_repo_implementation.dart';
import 'package:car_rental_app/features/auth/sign_up/domain/repo/sign_up_repo_domain.dart';
import 'package:car_rental_app/features/auth/sign_up/domain/use_cases/sign_up_use_cases.dart';
import 'package:car_rental_app/features/auth/sign_up/presentation/cubit/sign_up_cubit.dart';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> setupGetIt() async {
  //! Dio
  sl.registerLazySingleton<Dio>(() => Dio());

  //! DioFactory
  sl.registerLazySingleton<DioFactory>(() => DioFactory(dio: sl()));

  //!Data
  sl.registerLazySingleton<ApiSignUpService>(
    () => ApiSignUpService(dioFactory: sl()),
  );
  sl.registerLazySingleton<ApiLoginService>(
    () => ApiLoginService(dioFactory: sl()),
  );

  //!RepoImpl
  sl.registerLazySingleton<SignUpRepoDomain>(
    () => SignUpRepoImplementation(apiService: sl()),
  );
  sl.registerLazySingleton<LoginRepoDomain>(
    () => LoginRepoImplementation(loginApiService: sl()),
  );

  //!UseCases
  sl.registerLazySingleton<SignUpUseCases>(
    () => SignUpUseCases(singUpRepoDomain: sl()),
  );
  sl.registerLazySingleton<LoginUseCases>(
    () => LoginUseCases(loginRepoDomain: sl()),
  );

  //!Cubit
  sl.registerFactory(() => SignUpCubit(singUpUseCases: sl()));
  sl.registerFactory(() => LoginCubit(loginUseCases: sl()));
}
