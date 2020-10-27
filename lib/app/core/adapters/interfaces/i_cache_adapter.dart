import 'package:dartz/dartz.dart';

import '../../errors/cache_failures.dart';
import '../../errors/failures.dart';

abstract class ICacheAdapter {
  Future<Either<Failure, bool>> saveData(String key, String value);
  Future<Either<LoadCacheFailure, String>> getData(String key);
  Future<Either<DeleteByKeyCacheFailure, void>> deleteData(String key);
  Future<Either<WipeCacheFailure, void>> clearData();
}
