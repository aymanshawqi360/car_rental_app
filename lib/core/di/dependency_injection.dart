import 'package:car_rental_app/core/functions/user_check.dart';
import 'package:car_rental_app/core/functions/user_service.dart';
import 'package:car_rental_app/core/network/dio_factory.dart';
import 'package:car_rental_app/features/auth/email_verification/presentation/cubit/email_verification_cubit.dart';
import 'package:car_rental_app/features/auth/login/data/api/api_login_service.dart';
import 'package:car_rental_app/features/auth/login/data/repo_impl/login_repo_implementation.dart';
import 'package:car_rental_app/features/auth/login/domain/repo/login_repo_domain.dart';
import 'package:car_rental_app/features/auth/login/domain/use_cases/login_use_cases.dart';
import 'package:car_rental_app/features/auth/login/presentation/cubit/login_cubit.dart';
import 'package:car_rental_app/features/auth/new_password/data/api/new_password_service.dart';
import 'package:car_rental_app/features/auth/new_password/data/repo_impl/new_password_repo_implementation.dart';
import 'package:car_rental_app/features/auth/new_password/domain/repo/new_password_repo_domain.dart';
import 'package:car_rental_app/features/auth/new_password/domain/use_cases/new_password_use_cases.dart';
import 'package:car_rental_app/features/auth/new_password/presentation/cubit/new_password_cubit.dart';
import 'package:car_rental_app/features/auth/reset_password/data/api/reset_password_service.dart';
import 'package:car_rental_app/features/auth/reset_password/data/repo_impl/reset_password_repo_implementation.dart';
import 'package:car_rental_app/features/auth/reset_password/domain/repo/reset_password_repo_domain.dart';
import 'package:car_rental_app/features/auth/reset_password/domain/use_acses/reset_password_use_cases.dart';
import 'package:car_rental_app/features/auth/reset_password/presentation/cubit/reset_password_cubit.dart';
import 'package:car_rental_app/features/auth/sign_up/data/api/api_sign_up_service.dart';
import 'package:car_rental_app/features/auth/sign_up/data/repo_impl/sign_up_repo_implementation.dart';
import 'package:car_rental_app/features/auth/sign_up/domain/repo/sign_up_repo_domain.dart';
import 'package:car_rental_app/features/auth/sign_up/domain/use_cases/sign_up_use_cases.dart';
import 'package:car_rental_app/features/auth/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:car_rental_app/features/auth/verification_code/data/api/verification_code_api_service.dart';
import 'package:car_rental_app/features/auth/verification_code/data/repo_impl/verification_code_repo_implementation.dart';
import 'package:car_rental_app/features/auth/verification_code/domain/repo/verification_code_repo.dart';
import 'package:car_rental_app/features/auth/verification_code/domain/use_cases/verification_code_use_cases.dart';
import 'package:car_rental_app/features/auth/verification_code/presentation/cubit/verification_code_cubit.dart';
import 'package:car_rental_app/features/home/data/api/home_api_service.dart';
import 'package:car_rental_app/features/home/data/repo_impl/home_repo_implementaion.dart';
import 'package:car_rental_app/features/home/domain/repo/home_repo.dart';
import 'package:car_rental_app/features/home/domain/user_cases/brands_user_case.dart';
import 'package:car_rental_app/features/home/presentation/cubit/home_cubit.dart';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> setupGetIt() async {
  //! DioFactory
  sl.registerLazySingleton<Dio>(() => Dio());
  sl.registerLazySingleton<DioFactory>(() => DioFactory(dio: sl()));

  //!Data
  sl.registerLazySingleton<ApiSignUpService>(
    () => ApiSignUpService(dioFactory: sl()),
  );
  sl.registerLazySingleton<ApiLoginService>(
    () => ApiLoginService(dioFactory: sl()),
  );
  sl.registerLazySingleton<ResetPasswordService>(
    () => ResetPasswordService(dioFactory: sl()),
  );
  sl.registerLazySingleton<NewPasswordService>(
    () => NewPasswordService(dioFactory: sl()),
  );
  sl.registerLazySingleton<VerificationCodeApiService>(
    () => VerificationCodeApiService(dioFactory: sl()),
  );
  sl.registerLazySingleton<HomeApiService>(
    () => HomeApiService(dioFactory: sl()),
  );

  //!RepoImpl
  sl.registerLazySingleton<SignUpRepoDomain>(
    () => SignUpRepoImplementation(apiService: sl()),
  );
  sl.registerLazySingleton<LoginRepoDomain>(
    () => LoginRepoImplementation(loginApiService: sl()),
  );
  sl.registerLazySingleton<ResetPasswordRepoDomain>(
    () => ResetPasswordRepoImplementation(resetPasswordService: sl()),
  );
  sl.registerLazySingleton<NewPasswordRepoDomain>(
    () => NewPasswordRepoImplementation(newPasswordService: sl()),
  );
  sl.registerLazySingleton<VerificationCodeRepo>(
    () => VerificationCodeRepoImplementation(verificationCodeApiService: sl()),
  );
  sl.registerLazySingleton<HomeRepo>(
    () => HomeRepoImplementaion(homeApiService: sl()),
  );

  //!UseCases
  sl.registerLazySingleton<SignUpUseCases>(
    () => SignUpUseCases(singUpRepoDomain: sl()),
  );
  sl.registerLazySingleton<LoginUseCases>(
    () => LoginUseCases(loginRepoDomain: sl()),
  );
  sl.registerLazySingleton<ResetPasswordUseCases>(
    () => ResetPasswordUseCases(resetPasswordRepo: sl()),
  );
  sl.registerLazySingleton<NewPasswordUseCases>(
    () => NewPasswordUseCases(newPasswordRepoDomain: sl()),
  );
  sl.registerLazySingleton<VerificationCodeUseCases>(
    () => VerificationCodeUseCases(verificationCodeRepo: sl()),
  );
  sl.registerLazySingleton<BrandsUserCase>(
    () => BrandsUserCase(homeRepo: sl()),
  );

  //!Cubit
  sl.registerFactory(() => SignUpCubit(singUpUseCases: sl()));
  sl.registerFactory(() => LoginCubit(loginUseCases: sl()));
  sl.registerFactory(() => ResetPasswordCubit(resetPasswordUseCases: sl()));
  sl.registerFactory(() => NewPasswordCubit(newPasswordUseCases: sl()));
  sl.registerFactory(
    () => VerificationCodeCubit(verificationCodeUseCases: sl()),
  );
  sl.registerFactory(() => EmailVerificationCubit());
  sl.registerFactory(() => HomeCubit(brandsUserCase: sl()));

  //!Core
  sl.registerLazySingleton<UserCheck>(() => UserService());
}
