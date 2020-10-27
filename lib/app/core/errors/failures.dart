import 'package:equatable/equatable.dart';

import '../utils/constants/strings.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure({this.message});

  @override
  List<Object> get props => [message];
}

class NoConnectionFailure extends Failure {
  const NoConnectionFailure() : super(message: Strings.noConnectionError);
}

class BadRequestFailure extends Failure {
  const BadRequestFailure(String message) : super(message: message);
}

class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure() : super(message: Strings.UNAUTHORIZED_USER_BR);
}

class PaymentRequiredFailure extends Failure {
  const PaymentRequiredFailure() : super(message: "Pin incorreto");
}

class ForbiddenFailure extends Failure {
  const ForbiddenFailure() : super(message: Strings.serverError);
}

class NotFoundFailure extends Failure {
  const NotFoundFailure() : super(message: Strings.serverError);
}

class ServerFailure extends Failure {
  const ServerFailure() : super(message: Strings.serverError);
}

/// "Erro inesperado."
class UnrecognizedError extends Failure {
  const UnrecognizedError() : super(message: "Erro inesperado.");
}
