import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:spotify_clone/data/models/auth/create_user_request.dart';
import 'package:spotify_clone/data/models/auth/signin_user_request.dart';

abstract class AuthFirebaseService {
  Future<Either> signin(SigninUserRequest signinUserRequest);
  Future<Either> signup(CreateUserRequest createUserRequest);
}

class AuthFirebaseServiceImp extends AuthFirebaseService {
  @override
  Future<Either> signin(SigninUserRequest signinUserRequest) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: signinUserRequest.email,
        password: signinUserRequest.password,
      );

      return const Right("Signin was Successful");
    } on FirebaseAuthException catch (e) {
      String message = "";

      switch (e.code) {
        case "invalid-email" || "invalid-credential":
          message = "Wrong user or password";
          break;
        default:
          message = "Unknown error: ${e.message}";
      }

      return Left(message);
    }
  }

  @override
  Future<Either> signup(CreateUserRequest createUserRequest) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: createUserRequest.email,
        password: createUserRequest.password,
      );

      return const Right("Signup was Successful");
    } on FirebaseAuthException catch (e) {
      String message = "";

      switch (e.code) {
        case "weak-password":
          message = "The password provided is too weak";
          break;
        case "email-already-in-use":
          message = "An account already exists with that email";
          break;
        default:
          message = "Unknown error: ${e.message}";
      }

      return Left(message);
    }
  }
}
