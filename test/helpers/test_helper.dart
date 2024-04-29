import 'package:mockito/annotations.dart';
import 'package:lawyearn/features/auth/domain/repository/auth_repository.dart';
import 'package:http/http.dart' as http;

@GenerateMocks(
  [AuthRepository],
  customMocks: [MockSpec<http.Client>(as: #MockHttpClient)],
)
void main() {}
