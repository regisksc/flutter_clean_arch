import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';

import '../../../../core/adapters/http_adapter.dart';
import '../../../../core/errors/errors.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/errors/http_error.dart';
import '../../../../core/global/repository/repository.dart';
import '../../../../core/network/network_info.dart';
import '../../../../core/utils/constants/base_url.dart';
import '../../../auth/data/models/user/user_model.dart';
import '../../../auth/domain/entities/user/user_entity.dart';
import '../../domain/entities/sms_entity.dart';
import '../../domain/repositories/i_sms_repository.dart';
import '../models/sms_model.dart';

class SmsRepository implements ISmsRepository {
  final HttpAdapter httpAdapter;
  final NetworkInfo networkInfo;

  SmsRepository({@required this.httpAdapter, @required this.networkInfo});
  @override
  Future<Either<Failure, SmsEntity>> validatePhone({
    @required Map<String, dynamic> body,
    @required String endpoint,
  }) async {
    const SmsEntity entity = SmsEntity();
    const SmsModel model = SmsModel();
    final httpRepo = HttpRepository<SmsEntity>(httpAdapter: httpAdapter, networkInfo: networkInfo);

    final httpParams = HttpRequestParams(
      method: 'post',
      endpoint: endpoint,
      body: body,
    );
    final mappingParams = MappingParams(
      entity: entity,
      mapper: model,
    );

    final result = httpRepo.performHttpRequest(httpParams: httpParams, mappingParams: mappingParams);
    return result;
  }

  @override
  Future<Either<Failure, Either<SmsEntity, UserEntity>>> validateConfirmationCode({
    @required Map<String, dynamic> body,
    Map<String, dynamic> steps,
  }) async {
    steps ??= {};

    Map<String, dynamic> jsonMap;
    SmsEntity response;
    UserEntity responseAsUser;
    SmsModel smsModel;
    UserModel userModel;

    if (await networkInfo.isConnected) {
      try {
        jsonMap = await httpAdapter.request(
          endpoint: steps.isEmpty ? URL.endpoint('verify_code_signup') : URL.endpoint('verify_code_recovery'),
          method: 'post',
          body: body,
        );
        print("-> $jsonMap ");
        if (jsonMap['code'] == 400) return Left(BadRequestFailure(json.encode(jsonMap['message'])));

        if (jsonMap != null) {
          if (jsonMap.containsKey('data')) {
            // ? This means redirecting to authenticated area after confirming
            // ignore: missing_required_param
            userModel = UserModel()?.fromJson(jsonMap) as UserModel;
            responseAsUser = userModel;
            return Right(Right(responseAsUser));
          } else {
            smsModel = const SmsModel()?.fromJson(jsonMap) as SmsModel;
            response = smsModel;
            return Right(Left(response));
          }
        } else {
          return const Left(ServerFailure());
        }
      } on HttpError catch (e) {
        return Left(FailureHandler.handle(e));
      }
    } else {
      return const Left(NoConnectionFailure());
    }
    return const Left(UnrecognizedError());
  }
}
