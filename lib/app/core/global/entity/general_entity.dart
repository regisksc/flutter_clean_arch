import 'package:equatable/equatable.dart';

class GeneralEntity extends Equatable {
  final int code;
  final String message;

  const GeneralEntity({this.code, this.message});

  @override
  List<Object> get props => [code, message];
}
