import '../../../../../../core/global/model/mapper.dart';
import '../../../../domain/entities/user/child_entities/user_service_entity.dart';

class UserServiceModel extends UserServiceEntity implements Mapper {
  const UserServiceModel({int id, String identifier, String name, String icon, int status})
      : super(id: id, identifier: identifier, name: name, icon: icon, status: status);

  UserServiceModel fromJson(Map<String, dynamic> json) {
    return UserServiceModel(
      id: json['id'] as int,
      identifier: json['identifier'] as String,
      name: json['name'] as String,
      icon: json['icon'] as String,
      status: json['status'] as int,
    );
  }

  Map<String, dynamic> get toJson => {"id": id, "identifier": identifier, "name": name, "icon": icon, "status": status};

  @override
  String toString() => '$toJson';
}
