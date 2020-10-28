import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_clean_arch/app/modules/auth/domain/entities/user/user_entity.dart';
import 'package:flutter_clean_arch/app/modules/sms/domain/entities/sms_entity.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/global/usecases/usecase.dart';
import '../repositories/i_sms_repository.dart';

class ValidateConfirmationCodeUsecase extends Usecase<Either<SmsEntity, UserEntity>, ValidateConfirmationCodeParams> {
  final ISmsRepository repository;

  ValidateConfirmationCodeUsecase(this.repository);

  @override
  Future<Either<Failure, Either<SmsEntity, UserEntity>>> call(ValidateConfirmationCodeParams params) async {
    final Either<Failure, Either<SmsEntity, UserEntity>> response = await repository.validateConfirmationCode(
      body: params.body,
      steps: params.steps,
    );
    return response;
  }
}

class ValidateConfirmationCodeParams extends Equatable {
  final Map<String, dynamic> body;
  final Map<String, dynamic> steps;

  ValidateConfirmationCodeParams({@required this.body, this.steps = const {}})
      : assert(body.containsKey('countryCode')),
        assert(body.containsKey('cellNumber')),
        assert(body.containsKey('codeNumber')),
        // ignore: avoid_bool_literals_in_conditional_expressions
        assert(steps.isNotEmpty ? steps.containsKey('cpf') : true),
        // ignore: avoid_bool_literals_in_conditional_expressions
        assert(steps.isNotEmpty ? steps.containsKey('dob') : true);
  @override
  List<Object> get props => [body, steps];
}
