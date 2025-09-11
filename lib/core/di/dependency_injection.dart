import 'package:car_rental_app/core/network/dio_factory.dart';
import 'package:car_rental_app/features/auth/sing_up/data/api/api__singup_service.dart';
import 'package:car_rental_app/features/auth/sing_up/data/repo_impl/singup_repo_implementation.dart';
import 'package:car_rental_app/features/auth/sing_up/domain/repo/singup_repo_domain.dart';
import 'package:car_rental_app/features/auth/sing_up/domain/use_cases/singup_use_cases.dart';
import 'package:car_rental_app/features/auth/sing_up/presentation/cubit/singup_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> setupGetIt() async {
  //! Dio
  sl.registerLazySingleton<Dio>(() => Dio());

  //! DioFactory
  sl.registerLazySingleton<DioFactory>(() => DioFactory(dio: sl()));

  //!Data
  sl.registerLazySingleton<ApiSingUpService>(
    () => ApiSingUpService(dioFactory: sl()),
  );

  //!RepoImpl
  sl.registerLazySingleton<SingUpRepoDomain>(
    () => SingUpRepoImplementation(apiService: sl()),
  );

  //!UseCases
  sl.registerLazySingleton<SingUpUseCases>(
    () => SingUpUseCases(singUpRepoDomain: sl()),
  );

  //!Cubit
  sl.registerFactory(() => SingUpCubit(singUpUseCases: sl()));
}
