// import 'package:car_rental_app/core/network/dio_factory.dart';
// import 'package:car_rental_app/core/utils/app_strings.dart';
// import 'package:car_rental_app/features/auth/sing_up/data/api/api__singup_service.dart';
// import 'package:car_rental_app/features/auth/sing_up/data/api/api_singup_constants.dart';
// import 'package:car_rental_app/features/auth/sing_up/data/model/request_api_model.dart';
// import 'package:car_rental_app/features/auth/sing_up/data/model/response_api_model.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/annotations.dart';
// import 'package:mockito/mockito.dart';

// import 'singup_repo_implementation_test.mocks.dart';

// @GenerateNiceMocks([
//   MockSpec<ApiSingUpService>(),
//   MockSpec<DioFactory>(),
//   MockSpec<Dio>(),
// ])
// void main() {
//   late MockApiService mockApiService;
//   late MockDio mockDio;
//   late MockDioFactory mockDioFactory;
//   setUp(() {
//     mockDioFactory = MockDioFactory();
//     mockDio = MockDio();
//     mockApiService = MockApiService();

//     when(mockDioFactory.dio).thenReturn(mockDio);
//     when(mockApiService.dioFactory).thenReturn(mockDioFactory);
//   });

//   test("description", () async {
//     when(
//       mockDio.post(
//         AppStrings.baseUrl + ApiSingupConstants.singUpPath,
//         data: {
//           "full_name": "aa",
//           "email": "aa@gmail.com",
//           "password": "1234567989",
//           "country": "US",
//         },
//       ),
//     ).thenAnswer((_) async {
//       return Response(
//         requestOptions: RequestOptions(
//           path: ApiSingupConstants.singUpPath,
//           data: {
//             "user": {"id": 24, "full_name": "ayman", "email": "user@decor.com"},
//             "message": "User created successfully",
//             "tokens": {
//               "access":
//                   "asasaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaasasasadksaldksadlksadksa;dlksdlsakdsakd;lsakdsaldksaldksadlksaldksaldksaldksaldksadlkdladkadkakdaldkldka;dksdka;dkadkadkal;dka;dka;kdakdla;dkadkaldkhasudhdusahdusdhusadhusadhsaudhsauidhsaiudsahdi",
//               "refresh":
//                   "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9dksdka;dkadkadkal;dka;dka;kdakdla;dkadkaldkhasudhdusahdusdhusadhusadhsaudhsauidhsaiudsahdi",
//             },
//           },
//         ),
//       );
//     });
//     final dd = await mockApiService.singUp(
//       requestApiModel: RequestApiModel(
//         fullName: "sasasa",
//         email: "sasasasa@gmail.com",
//         password: "56565",
//         country: "US",
//       ),
//     );
//     expect(dd["user"]["email"], "aa@gmail.com");
//   });
// }
