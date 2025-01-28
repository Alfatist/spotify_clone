import 'package:spotify_clone/data/models/auth/create_user_request.dart';

abstract class AuthRepository {
  Future<void> signin();

  Future<void> signup(CreateUserRequest createUserRequest);
}
