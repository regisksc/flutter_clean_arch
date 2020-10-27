import 'dart:convert';

import 'package:http/http.dart';
import 'package:meta/meta.dart';

import '../errors/http_error.dart';
import 'interfaces/i_http_adapter.dart';

class HttpAdapter implements IHttpAdapter {
  final Client client;

  HttpAdapter(this.client);

  @override
  Future<Map<String, dynamic>> request({
    @required String endpoint,
    @required String method,
    Map<String, dynamic> body,
    String authorization,
  }) async {
    final jsonBody = body != null ? jsonEncode(body) : null;
    final Map<String, String> headers = {
      'Authorization': authorization,
      'content-type': 'application/json',
      'accept': 'application/json',
    };

    var response = Response('', 500);
    try {
      switch (method) {
        case 'get':
          response = await client.get(endpoint, headers: headers);
          break;
        case 'delete':
          response = await client.delete(endpoint, headers: headers);
          break;
        case 'post':
          response = await client.post(endpoint, headers: headers, body: jsonBody);
          break;
      }
    } catch (error) {
      throw HttpError.serverError;
    }
    return _handleResponse(response);
  }

  Map<String, dynamic> _handleResponse(Response response) {
    print(response.body);
    switch (response.statusCode) {
      case 200:
        return (response.body.isEmpty ? null : jsonDecode(response.body)) as Map<String, dynamic>;
      case 204:
        return null;
      case 400:
        return (response.body.isEmpty ? null : jsonDecode(response.body)) as Map<String, dynamic>;
      case 401:
        throw HttpError.unauthorized;
      case 402:
        throw HttpError.paymentRequired;
      case 403:
        throw HttpError.forbidden;
      case 404:
        throw HttpError.notFound;
      default:
        throw HttpError.serverError;
    }
  }
}
