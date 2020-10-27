import 'package:flutter/foundation.dart';
import 'package:flutter_clean_arch/app/modules/auth/data/models/user/child_models/user_service_model.dart';

import '../../../../../core/global/model/mapper.dart';
import '../../../domain/entities/user/child_entities/user_data_entity.dart';
import '../../../domain/entities/user/user_entity.dart';
import 'child_models/user_data_model.dart';

class UserModel extends UserEntity implements Mapper {
  const UserModel({
    @required int code,
    @required String message,
    @required String token,
    @required UserDataEntity user,
    @required List<UserServiceModel> services,
  }) : super(
          code: code,
          message: message,
          token: token,
          user: user,
          services: services,
        );

  fromJson(Map<String, dynamic> json) {
    final List<UserServiceModel> servicesList = (json['services'] as List).map(
      (service) => UserServiceModel().fromJson(service),
    );
    final UserDataModel user = UserDataModel().fromJson(json['user']);
    return UserModel(
      code: json['code'] as int,
      message: json['message'] as String,
      token: json['token'] as String,
      user: user,
      services: servicesList,
    );
  }

  Map<String, dynamic> get toJson =>
      {'code': code, 'message': message, 'token': token, 'user': user, 'services': services};

  @override
  String toString() => '$toJson';
}
