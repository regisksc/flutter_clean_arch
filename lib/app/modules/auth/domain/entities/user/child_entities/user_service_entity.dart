import 'package:equatable/equatable.dart';

class UserServiceEntity extends Equatable {
  final int id;
  final String identifier;
  final String name;
  final String icon;
  final int status;

  const UserServiceEntity({
    this.id,
    this.identifier,
    this.name,
    this.icon,
    this.status,
  });

  @override
  List<Object> get props => [id, identifier, name, icon, status];
}
