import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../entity/general_entity.dart';
import '../../model/mapper.dart';

class MappingParams extends Equatable {
  final GeneralEntity entity;
  final Mapper mapper;

  MappingParams({@required this.entity, @required this.mapper});
  @override
  List<Object> get props => [entity, mapper];
}
