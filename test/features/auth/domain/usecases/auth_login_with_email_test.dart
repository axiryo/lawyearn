import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:lawyearn/core/common/entities/profile.dart';
import 'package:lawyearn/core/error/failure.dart';
import 'package:lawyearn/features/auth/domain/usecases/auth_login_with_email.dart';
import 'package:mockito/mockito.dart';

import '../../../../helpers/test_helper.mocks.dart';

void main() {
  late MockAuthRepository mockAuthRepository;
  late AuthLoginWithEmailUseCase authLoginWithEmailUseCase;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    authLoginWithEmailUseCase = AuthLoginWithEmailUseCase(mockAuthRepository);

    provideDummy<Either<Failure, Profile>>(const Right(Profile(
      id: 'dummyId',
      email: 'dummy@email.com',
      name: 'Dummy Name',
      isEmailVerified: false,
    )));
  });

  const testAuthProfile = Profile(
    id: '1',
    email: 'asirrhcaridad@gmail.com',
    name: 'John',
    isEmailVerified: false,
  );

  const testAuthEmail = 'asirrhcaridad@gmail.com';
  const testAuthPassword = '123123123';

  test('Should login the user using email and password', () async {
    // arrange
    when(mockAuthRepository.loginWithEmail(
            email: testAuthEmail, password: testAuthPassword))
        .thenAnswer((_) async => const Right(testAuthProfile));

    // act
    final result = await authLoginWithEmailUseCase.call(
        UserLoginParams(email: testAuthEmail, password: testAuthPassword));

    // assert
    expect(result, const Right(testAuthProfile));
  });
}
