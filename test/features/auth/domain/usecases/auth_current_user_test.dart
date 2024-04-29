import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:lawyearn/core/common/entities/profile.dart';
import 'package:lawyearn/core/error/failure.dart';
import 'package:lawyearn/core/usecase/usecase.dart';
import 'package:lawyearn/features/auth/domain/usecases/auth_current_user.dart';
import 'package:mockito/mockito.dart';

import '../../../../helpers/test_helper.mocks.dart';

void main() {
  late MockAuthRepository mockAuthRepository;
  late AuthCurrentUserUseCase authCurrentUserUseCase;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    authCurrentUserUseCase = AuthCurrentUserUseCase(mockAuthRepository);
    provideDummy<Either<Failure, Profile>>(const Right(
        Profile(id: 'dummyId', email: 'dummy@email.com', name: 'Dummy Name')));
  });

  const testAuthProfile =
      Profile(id: '1', email: 'asirrhcaridad@gmail.com', name: 'John');

  test('Should get the current user', () async {
    // arrange
    when(mockAuthRepository.currentUser())
        .thenAnswer((_) async => const Right(testAuthProfile));

    // act
    final result = await authCurrentUserUseCase.call(NoParams());

    // assert
    expect(result, const Right(testAuthProfile));
  });
}
