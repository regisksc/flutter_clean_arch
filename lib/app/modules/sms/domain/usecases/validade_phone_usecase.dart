import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/global/usecases/usecase.dart';
import '../entities/sms_entity.dart';
import '../repositories/i_sms_repository.dart';

class ValidatePhoneUsecase implements Usecase<SmsEntity, ValidatePhoneParams> {
  final ISmsRepository repository;

  ValidatePhoneUsecase(this.repository);

  @override
  Future<Either<Failure, SmsEntity>> call(ValidatePhoneParams params) async {
    final Either<Failure, SmsEntity> response = await repository.validatePhone(
      endpoint: params.endpoint,
      body: params.body,
    );
    return response;
  }
}

class ValidatePhoneParams extends Equatable {
  final String endpoint;
  final Map<String, dynamic> body;

  ValidatePhoneParams({@required this.endpoint, @required this.body})
      : assert(body.containsKey('countryCode')),
        assert(body.containsKey('cellNumber'));
  @override
  List<Object> get props => [endpoint, body];
}
