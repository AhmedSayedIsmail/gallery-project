import 'package:task_promina/core/utils/constants_keys.dart';
import 'package:task_promina/domain/entities/user_entities.dart';

class LoginUserModel extends LoginUserEntity {
  const LoginUserModel({required super.userData, required super.token});

  factory LoginUserModel.fromJson(Map<String, dynamic> json) => LoginUserModel(
      token: json[ConstantsKeys.token],
      userData: LoginUserData.fromJson(json[ConstantsKeys.user]));
}
