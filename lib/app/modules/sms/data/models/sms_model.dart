import '../../../../core/global/model/mapper.dart';
import '../../domain/entities/sms_entity.dart';

class SmsModel extends SmsEntity implements Mapper {
  const SmsModel({int code, String message, Map<String, dynamic> steps})
      : super(code: code, message: message, steps: steps);

  fromJson(Map<String, dynamic> json) {
    return SmsModel(
      code: json['code'] as int,
      message: json['message'] as String,
      steps: json.containsKey('steps') ? json['steps'] as Map<String, dynamic> : {},
    );
  }

  Map<String, dynamic> get toJson => {'code': code, 'message': message, 'steps': steps};

  @override
  String toString() => '$toJson';
}
