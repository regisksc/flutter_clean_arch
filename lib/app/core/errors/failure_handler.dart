import 'package:dartz/dartz.dart';

import 'errors.dart';

abstract class FailureHandler {
  // ignore: missing_return
  static Failure handle(HttpError e) {
    print(e);
    switch (e) {
      case HttpError.unauthorized:
        return const UnauthorizedFailure();
        break;
      case HttpError.paymentRequired:
        return const PaymentRequiredFailure();
        break;
      case HttpError.forbidden:
        return const ForbiddenFailure();
        break;
      case HttpError.notFound:
        return const NotFoundFailure();
        break;
      case HttpError.serverError:
        return const ServerFailure();
        break;
      case HttpError.badRequest:
        print(e);
        break;
      case HttpError.invalidData:
        print(e);
        break;
      default:
        return const UnrecognizedError();
        break;
    }
  }
}
