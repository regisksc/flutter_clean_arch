import 'package:flutter/material.dart';

abstract class IHttpAdapter {
  Future<Map<String, dynamic>> request({
    @required String endpoint,
    @required String method,
    Map<String, dynamic> body,
    String authorization,
  });
}
