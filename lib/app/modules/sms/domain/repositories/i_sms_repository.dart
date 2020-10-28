import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../../../../core/errors/failures.dart';
import '../../../auth/domain/entities/user/user_entity.dart';
import '../entities/sms_entity.dart';

abstract class ISmsRepository {
  /// Sends number to be verified
  /// returns a simple response of StatusCode and Message
  ///
  Future<Either<Failure, SmsEntity>> validatePhone({Map<String, dynamic> body, String endpoint});

  /// Sends confirmation code to be verified
  /// returns a simple response of StatusCode and Message
  ///
  Future<Either<Failure, Either<SmsEntity, UserEntity>>> validateConfirmationCode({
    // ignore: invalid_required_named_param
    @required Map<String, dynamic> body,
    Map<String, dynamic> steps,
  });
}
