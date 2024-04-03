import 'package:equatable/equatable.dart';
import 'package:task_promina/core/utils/constants_keys.dart';

class LoginUserEntity extends Equatable {
  final LoginUserData userData;
  final String token;

  const LoginUserEntity({required this.token, required this.userData});
  @override
  List<Object?> get props => [token, userData];
}

class LoginUserData extends Equatable {
  final int id;
  final String name;
  final String email;

  const LoginUserData(
      {required this.id, required this.name, required this.email});

  factory LoginUserData.fromJson(Map<String, dynamic> json) => LoginUserData(
      id: json[ConstantsKeys.id],
      name: json[ConstantsKeys.name],
      email: json[ConstantsKeys.email]);

  @override
  List<Object?> get props => [
        id,
        name,
        email,
      ];
}
