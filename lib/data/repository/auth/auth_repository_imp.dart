import 'package:fpdart/fpdart.dart';
import 'package:spotify_clone/data/models/auth/create_user_request.dart';
import 'package:spotify_clone/data/models/auth/signin_user_request.dart';
import 'package:spotify_clone/data/sources/auth/auth_firebase_service.dart';
import 'package:spotify_clone/domain/repository/auth/auth.dart';
import 'package:spotify_clone/service_locator.dart';

class AuthRepositoryImp extends AuthRepository {
  @override
  Future<Either> signin(SigninUserRequest signinUserRequest) async {
    return await sl<AuthFirebaseService>().signin(signinUserRequest);
  }

  /// Perceba que o AuthFirebaseServiceImp veio parar aqui, através do singleton criado pelo getIt.
  /// Eu criaria com static.
  @override
  Future<Either> signup(CreateUserRequest createUserRequest) async {
    return await sl<AuthFirebaseService>().signup(createUserRequest);
  }

  @override
  Future<Either> getUser() async {
    return await sl<AuthFirebaseService>().getUser();
  }
}
