import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/global/usecases/usecase.dart';
import '../entities/user/user_entity.dart';
import '../repositories/i_register_repository.dart';

class RegisterWithCredentialsUsecase implements Usecase<UserEntity, RegisterWithCredentialsParams> {
  final IRegisterRepository repository;

  RegisterWithCredentialsUsecase(this.repository);

  @override
  Future<Either<Failure, UserEntity>> call(RegisterWithCredentialsParams params) async {
    final Either<Failure, UserEntity> response = await repository.registerWithCredentials(params.body);
    return response;
  }
}

class RegisterWithCredentialsParams extends Equatable {
  final Map<String, dynamic> body;

  RegisterWithCredentialsParams(
    this.body,
  )   : assert(
          body.containsKey('identifier') && (body['identifier'] != null || body['identifier'] != ''),
        ),
        assert(
          body.containsKey('password') && (body['password'] != null || body['password'] != ''),
        ),
        assert(
          body.containsKey('countryCode') && (body['countryCode'] != null || body['countryCode'] != ''),
        ),
        assert(
          body.containsKey('cellNumber') && (body['cellNumber'] != null || body['cellNumber'] != ''),
        ),
        assert(
          body.containsKey('codeNumber') && (body['codeNumber'] != null || body['codeNumber'] != ''),
        );

  @override
  List<Object> get props => [body];
}
