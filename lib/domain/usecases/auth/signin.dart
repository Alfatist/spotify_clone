import 'package:fpdart/fpdart.dart';
import 'package:spotify_clone/core/usecase/usecase.dart';
import 'package:spotify_clone/data/models/auth/signin_user_request.dart';
import 'package:spotify_clone/domain/repository/auth/auth.dart';
import 'package:spotify_clone/service_locator.dart';

class SigninUseCase implements Usecase<Either, SigninUserRequest> {
  @override
  Future<Either> call({SigninUserRequest? params}) {
    return sl<AuthRepository>().signin(params!);
  }
}
