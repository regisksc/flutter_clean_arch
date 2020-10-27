import 'package:flutter_clean_arch/app/modules/auth/data/models/user/child_models/user_service_model.dart';

import '../../../../../core/global/entity/general_entity.dart';
import 'child_entities/user_data_entity.dart';

class UserEntity extends GeneralEntity {
  final int code;
  final String message;
  final String token;
  final UserDataEntity user;
  final List<UserServiceModel> services;

  const UserEntity({
    this.code,
    this.message,
    this.token,
    this.user,
    this.services,
  }) : super(code: code, message: message);

  String get formattedListOfServices => "Lista: MOSTRAR LISTA FORMATADA";

  @override
  List<Object> get props => [
        code,
        message,
        token,
        user,
        services,
      ];
}
