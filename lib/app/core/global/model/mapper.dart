import '../entity/general_entity.dart';

/// Abstraction of all mapper classes
abstract class Mapper {
  fromJson(Map<String, dynamic> json);
  Map<String, dynamic> get toJson;
  String toString();
}
