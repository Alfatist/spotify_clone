import 'package:fpdart/fpdart.dart';
import 'package:spotify_clone/data/models/auth/create_user_request.dart';
import 'package:spotify_clone/data/models/auth/signin_user_request.dart';

abstract class AuthRepository {
  Future<Either> signin(SigninUserRequest signinUserRequest);

  Future<Either> signup(CreateUserRequest createUserRequest);
}
