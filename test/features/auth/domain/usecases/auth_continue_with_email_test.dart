import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:lawyearn/core/error/failure.dart';
import 'package:lawyearn/features/auth/domain/usecases/auth_continue_with_email.dart';
import 'package:mockito/mockito.dart';

import '../../../../helpers/test_helper.mocks.dart';

void main() {
  late MockAuthRepository mockAuthRepository;
  late AuthContinueWithEmailUseCase authContinueWithEmailUseCase;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    authContinueWithEmailUseCase =
        AuthContinueWithEmailUseCase(mockAuthRepository);

    provideDummy<Either<Failure, bool>>(const Right(true));
  });

  const testAuthEmail = 'asirrhcaridad@gmail.com';

  test('Should be able to fetch the email', () async {
    // arrange
    when(mockAuthRepository.continueWithEmail(email: testAuthEmail))
        .thenAnswer((_) async => const Right(true));

    // act
    final result = await authContinueWithEmailUseCase.call(testAuthEmail);

    // assert
    expect(result, const Right(true));
  });
}
