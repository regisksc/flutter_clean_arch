import 'package:dartz/dartz.dart';

import '../../../../core/adapters/cache_adapter.dart';
import '../../../../core/adapters/interfaces/i_http_adapter.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/global/repository/repository.dart';
import '../../../../core/network/network_info.dart';
import '../../../../core/utils/constants/base_url.dart';
import '../../../../core/utils/constants/storage_keys.dart';
import '../../domain/entities/user/user_entity.dart';
import '../../domain/repositories/i_register_repository.dart';
import '../models/user/user_model.dart';

class RegisterRepository implements IRegisterRepository {
  final IHttpAdapter httpAdapter;
  final NetworkInfo networkInfo;
  final CacheAdapter cacheAdapter;

  RegisterRepository({this.httpAdapter, this.networkInfo, this.cacheAdapter});
  @override
  Future<Either<Failure, UserEntity>> registerWithCredentials(Map<String, dynamic> body) async {
    const UserEntity entity = UserEntity();
    // ignore: missing_required_param
    UserModel model = UserModel();
    final httpRepo = HttpRepository<UserEntity>(httpAdapter: httpAdapter, networkInfo: networkInfo);

    final httpParams = HttpRequestParams(
      method: 'post',
      endpoint: URL.endpoint('signup'),
      body: body,
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
