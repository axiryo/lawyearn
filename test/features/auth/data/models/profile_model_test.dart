import 'package:flutter_test/flutter_test.dart';
import 'package:lawyearn/core/common/entities/profile.dart';
import 'package:lawyearn/features/auth/data/models/profile_model.dart';

void main() {
  test('Should be a subclass of Profile entity', () async {
    const testProfileModel = ProfileModel(
      id: '1',
      email: 'john@gmail.com',
      firstName: 'John',
      middleName: '',
      lastName: 'T3',
      isEmailVerified: false,
    );
    expect(testProfileModel, isA<Profile>());
  });
}
