import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify_clone/data/models/auth/create_user_request.dart';

abstract class AuthFirebaseService {
  Future<void> signin();
  Future<void> signup(CreateUserRequest createUserRequest);
}

class AuthFirebaseServiceImp extends AuthFirebaseService {
  @override
  Future<void> signin() {
    // TODO: implement signin
    throw UnimplementedError();
  }

  @override
  Future<void> signup(CreateUserRequest createUserRequest) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: createUserRequest.email, password: createUserRequest.password);
    } on FirebaseAuthException {}
  }
}
