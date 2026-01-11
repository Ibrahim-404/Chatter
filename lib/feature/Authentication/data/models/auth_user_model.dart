import 'package:chatter/feature/Authentication/domain/entities/auth_user_entity.dart';

class AuthUserModel extends AuthUserEntity {
  AuthUserModel({required super.uid, required super.phoneNumber});
  factory AuthUserModel.fromJson(Map<String, dynamic> json) {
    return AuthUserModel(uid: json['uid'], phoneNumber: json['phoneNumber']);
  }
}
