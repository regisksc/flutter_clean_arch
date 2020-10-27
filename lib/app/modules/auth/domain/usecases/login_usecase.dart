import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/global/usecases/usecase.dart';
import '../entities/user/user_entity.dart';
import '../repositories/i_login_repository.dart';

class LoginUsecase extends Usecase<UserEntity, LoginParams> {
  final ILoginRepository repository;

  LoginUsecase(this.repository);
  @override
  Future<Either<Failure, UserEntity>> call(params) async {
    final Either<Failure, UserEntity> response = await repository.login(
      identifier: params.identifier,
      password: params.password,
      type: params.type,
    );
    return response;
  }
}

class LoginParams extends Equatable {
  final String identifier;
  final String password;
  final String type;

  const LoginParams({@required this.identifier, @required this.type, this.password});
  @override
  List<Object> get props => [identifier, password, type];
}
