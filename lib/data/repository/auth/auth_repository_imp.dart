import 'package:spotify_clone/domain/repository/auth/auth.dart';

class AuthRepositoryImp extends AuthRepository {
  // repare que aqui eu tenho um problema: devo importar o auth_firebase_service_imp.
  // Mas para isso iriamos criar uma instância do objeto aqui dentro, o que não é legal.
  // Portanto, o getIt resolverá nosso problema no próximo commit

  @override
  Future<void> signin() {
    // TODO: implement signin
    throw UnimplementedError();
  }

  @override
  Future<void> signup() {
    // TODO: implement signup
    throw UnimplementedError();
  }
}
