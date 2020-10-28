import '../../../../core/global/entity/general_entity.dart';

class SmsEntity extends GeneralEntity {
  final Map<String, dynamic> steps;

  const SmsEntity({int code, String message, this.steps}) : super(code: code, message: message);
}
