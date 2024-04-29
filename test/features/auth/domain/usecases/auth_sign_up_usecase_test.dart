import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:lawyearn/core/common/entities/profile.dart';
import 'package:lawyearn/core/error/failure.dart';
import 'package:lawyearn/features/auth/domain/usecases/auth_sign_up_usecase.dart';
import 'package:mockito/mockito.dart';

import '../../../../helpers/test_helper.mocks.dart';

void main() {
  late MockAuthRepository mockAuthRepository;
  late AuthSignUpUseCase authSignUpUseCase;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    authSignUpUseCase = AuthSignUpUseCase(mockAuthRepository);
    provideDummy<Either<Failure, Profile>>(const Right(
        Profile(id: 'dummyId', email: 'dummy@email.com', name: 'Dummy Name')));
  });

  const testAuthProfile =
      Profile(id: '1', email: 'asirrhcaridad@gmail.com', name: 'John');

  const testAuthName = 'John';
  const testAuthEmail = 'asirrhcaridad@gmail.com';
  const testAuthPassword = '123123123';

  test('Should sign up a user', () async {
    // arrange
    when(mockAuthRepository.signUpWithEmail(
            name: testAuthName,
            email: testAuthEmail,
            password: testAuthPassword))
        .thenAnswer((_) async => const Right(testAuthProfile));

    // act
    final result = await authSignUpUseCase.call(UserSignUpParameters(
      name: testAuthName,
      email: testAuthEmail,
      password: testAuthPassword,
    ));

    // assert
    expect(result, const Right(testAuthProfile));
  });
}
