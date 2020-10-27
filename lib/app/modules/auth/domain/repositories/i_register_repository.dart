import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../../../../core/errors/failures.dart';
import '../entities/user/user_entity.dart';

abstract class IRegisterRepository {
  /// Registers account with email and passsword
  /// returns a [UserEntity]
  ///
  Future<Either<Failure, UserEntity>> registerWithCredentials(Map<String, dynamic> body);
}
