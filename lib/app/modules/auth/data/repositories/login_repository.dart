import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../../../../core/adapters/interfaces/i_cache_adapter.dart';
import '../../../../core/adapters/interfaces/i_http_adapter.dart';
import '../../../../core/errors/errors.dart';
import '../../../../core/global/repository/repository.dart';
import '../../../../core/network/network_info.dart';
import '../../../../core/utils/constants/base_url.dart';
import '../../../../core/utils/constants/storage_keys.dart';
import '../../domain/entities/user/user_entity.dart';
import '../../domain/repositories/i_login_repository.dart';
import '../models/user/user_model.dart';

class LoginRepository implements ILoginRepository {
  final NetworkInfo networkInfo;
  final ICacheAdapter cacheAdapter;
  final IHttpAdapter httpAdapter;

  LoginRepository({@required this.networkInfo, @required this.cacheAdapter, @required this.httpAdapter});
  @override
  Future<Either<Failure, UserEntity>> login({String identifier, String type, String password}) async {
    const UserEntity entity = UserEntity();
    // ignore: missing_required_param
    UserModel model = UserModel();
    final httpRepo = HttpRepository<UserEntity>(httpAdapter: httpAdapter, networkInfo: networkInfo);

    final httpParams = HttpRequestParams(
      method: 'post',
      endpoint: URL.endpoint('login'),
      body: {'type': type, 'identifier': identifier, 'password': password},
    );
    final mappingParams = MappingParams(
      entity: entity,
      mapper: model,
    );

    final result = await httpRepo.performHttpRequest(httpParams: httpParams, mappingParams: mappingParams);
    final extract = result.fold(id, id);
    if (extract is UserEntity) {
      cacheAdapter.saveData(StorageKeys.userToken, extract.token);
      cacheAdapter.saveData(StorageKeys.userData, extract.toString());
    }
    return result;
  }
}
