import 'package:equatable/equatable.dart';

class AuthEntities extends Equatable {
  final bool status;
  final int statusCode;
  final String statusMessage;

  const AuthEntities({
    required this.status,
    required this.statusCode,
    required this.statusMessage,
  });

  @override
  List<Object?> get props => [
    status,
    statusCode,
    statusMessage,
  ];
}
