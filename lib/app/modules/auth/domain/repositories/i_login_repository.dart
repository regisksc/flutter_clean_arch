import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../../../../core/errors/failures.dart';
import '../entities/user/user_entity.dart';

abstract class ILoginRepository {
  /// Logs account in with a type of authentication
  /// returns a [UserEntity]
  ///
  Future<Either<Failure, UserEntity>> login({
    @required String identifier,
    @required String type,
    String password,
  });
}
