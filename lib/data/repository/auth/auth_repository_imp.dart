import 'package:spotify_clone/data/models/auth/create_user_request.dart';
import 'package:spotify_clone/data/sources/auth/auth_firebase_service.dart';
import 'package:spotify_clone/domain/repository/auth/auth.dart';
import 'package:spotify_clone/service_locator.dart';

class AuthRepositoryImp extends AuthRepository {
  @override
  Future<void> signin() {
    // TODO: implement signin
    throw UnimplementedError();
  }

  /// Perceba que o AuthFirebaseServiceImp veio parar aqui, através do singleton criado pelo getIt.
  /// Eu criaria com static.
  @override
  Future<void> signup(CreateUserRequest createUserRequest) async {
    await sl<AuthFirebaseService>().signup(createUserRequest);
  }
}
