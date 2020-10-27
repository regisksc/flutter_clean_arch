import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../../adapters/interfaces/i_http_adapter.dart';
import '../../errors/errors.dart';
import '../../network/network_info.dart';
import 'repository.dart';

class HttpRepository<Entity> {
  final INetworkInfo networkInfo;
  final IHttpAdapter httpAdapter;

  HttpRepository({@required this.networkInfo, @required this.httpAdapter});

  Future<Either<Failure, Entity>> performHttpRequest({
    @required HttpRequestParams httpParams,
    @required MappingParams mappingParams,
  }) async {
    final bool isConnected = await networkInfo.isConnected;
    Map<String, dynamic> jsonMap;
    Entity response;

    final endpoint = httpParams.endpoint;
    final method = httpParams.method;
    final body = httpParams.body;
    final authorization = httpParams.authorization;

    if (isConnected) {
      try {
        jsonMap = await httpAdapter.request(
          endpoint: endpoint,
          method: method,
          body: body,
          authorization: authorization,
        );
        print("-> $jsonMap ");
        if (jsonMap != null) {
          final model = mappingParams.mapper.fromJson(jsonMap);
          response = model as Entity;
          if (model.code == 400) return Left(BadRequestFailure(model.message.toString()));
          return Right(response);
        } else {
          return const Left(ServerFailure());
        }
      } on HttpError catch (e) {
        return Left(FailureHandler.handle(e));
      }
    } else {
      return const Left(NoConnectionFailure());
    }
  }
}
