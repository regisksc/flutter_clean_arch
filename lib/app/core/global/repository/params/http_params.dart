import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class HttpRequestParams extends Equatable {
  final String method;
  final String endpoint;
  final String authorization;
  final Map<String, dynamic> body;

  HttpRequestParams({
    @required this.method,
    @required this.endpoint,
    this.authorization,
    this.body,
  });
  @override
  List<Object> get props => [method, endpoint, body, authorization];
}
