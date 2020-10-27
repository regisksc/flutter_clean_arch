import 'package:equatable/equatable.dart';

class UserDataEntity extends Equatable {
  final int id;
  final String hashId;
  final String name;
  final String phone;
  final String nickname;
  final String userType;
  final String cpfCnpj;
  final String dob;
  final String wallet;
  final int passwordValidStatus;
  final int needRegisterPinPass;
  final int needAdicionalData;

  const UserDataEntity({
    this.id,
    this.hashId,
    this.name,
    this.phone,
    this.nickname,
    this.userType,
    this.cpfCnpj,
    this.dob,
    this.wallet,
    this.passwordValidStatus,
    this.needRegisterPinPass,
    this.needAdicionalData,
  });

  @override
  List<Object> get props => [
        id,
        name,
        phone,
        nickname,
        userType,
        cpfCnpj,
        dob,
        wallet,
        passwordValidStatus,
        needRegisterPinPass,
        needAdicionalData,
      ];
}
