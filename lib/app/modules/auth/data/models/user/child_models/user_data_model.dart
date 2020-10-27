import 'package:flutter/foundation.dart';
import 'package:flutter_clean_arch/app/modules/auth/domain/entities/user/child_entities/user_data_entity.dart';

class UserDataModel extends UserDataEntity {
  const UserDataModel({
    @required int id,
    @required String hashId,
    @required String name,
    @required String phone,
    @required String nickname,
    @required String userType,
    @required String cpfCnpj,
    @required String dob,
    @required String wallet,
    @required int passwordValidStatus,
    @required int needRegisterPinPass,
    @required int needAdicionalData,
  }) : super(
          id: id,
          hashId: hashId,
          name: name,
          phone: phone,
          nickname: nickname,
          userType: userType,
          cpfCnpj: cpfCnpj,
          dob: dob,
          wallet: wallet,
          passwordValidStatus: passwordValidStatus,
          needRegisterPinPass: needRegisterPinPass,
          needAdicionalData: needAdicionalData,
        );

  fromJson(Map<String, dynamic> json) {
    return UserDataModel(
      cpfCnpj: json['cpf_cnpj'] as String,
      dob: json['dob'] as String,
      hashId: json['hash_id'] as String,
      id: json['id'] as int,
      name: json['name'] as String,
      needAdicionalData: json['need_adicional_data'] as int,
      needRegisterPinPass: json['need_register_pin_pass'] as int,
      nickname: json['nickname'] as String,
      passwordValidStatus: json['password_valid_status'] as int,
      phone: json['phone'] as String,
      userType: json['user_type'] as String,
      wallet: json['wallet'] as String,
    );
  }

  Map<String, dynamic> get toJson => {
        "id": id,
        "hash_id": hashId,
        "name": name,
        "phone": phone,
        "nickname": nickname,
        "user_type": userType,
        "cpf_cnpj": cpfCnpj,
        "dob": dob,
        "wallet": wallet,
        "password_valid_status": passwordValidStatus,
        "need_register_pin_pass": needRegisterPinPass,
        "need_adicional_data": needAdicionalData,
      };

  @override
  String toString() => '$toJson';
}
