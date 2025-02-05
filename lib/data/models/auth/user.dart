import 'package:spotify_clone/domain/entities/auth/user.dart';

class UserModel {
  String? imageUrl;
  String? fullName;
  String? email;

  UserModel({
    this.imageUrl,
    this.fullName,
    this.email,
  });

  UserModel.fromJson(Map<String, dynamic> data) {
    fullName = data["name"];
    email = data["email"];
  }
}

extension UserModelX on UserModel {
  UserEntity toEntity() {
    return UserEntity(email: email, fullName: fullName, imageUrl: imageUrl);
  }
}
