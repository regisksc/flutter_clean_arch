import 'package:dartz/dartz.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../errors/cache_failures.dart';
import '../errors/failures.dart';
import 'interfaces/i_cache_adapter.dart';

class CacheAdapter implements ICacheAdapter {
  CacheAdapter._privateConstructor();
  static final CacheAdapter _instance = CacheAdapter._privateConstructor();
  factory CacheAdapter() => _instance;

  FlutterSecureStorage _storage;
  FlutterSecureStorage get storage => _storage ??= const FlutterSecureStorage();

  @override
  Future<Either<Failure, bool>> saveData(String key, String value) async {
    bool status;
    if (value != null) {
      try {
        await storage.write(key: key, value: value);
        return const Right(true);
      } on Exception catch (e) {
        return const Left(SaveCacheFailure());
      }
    } else {
      return const Left(NullInputFailure());
    }
  }

  @override
  Future<Either<LoadCacheFailure, String>> getData(String key) async {
    String result;
    try {
      result = await storage.read(key: key);
      return Right(result ?? '');
    } catch (e) {
      // ignore: avoid_print
      print('Não existe nada salvo');
      return const Left(LoadCacheFailure());
    }
  }

  @override
  Future<Either<DeleteByKeyCacheFailure, void>> deleteData(String key) async {
    try {
      await storage.delete(key: key);
      return const Right(null);
    } on Exception catch (e) {
      print("Erro no CacheAdapter (deleteData passando $key): \n$e");
      return left(const DeleteByKeyCacheFailure());
    }
  }

  @override
  Future<Either<WipeCacheFailure, void>> clearData() async {
    try {
      await storage.deleteAll();
      return const Right(null);
    } on Exception catch (e) {
      print("Erro no CacheAdapter (clearData): \n$e");
      return const Left(WipeCacheFailure());
    }
  }
}
