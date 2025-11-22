import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User({
    required this.id,
    required this.email,
    required this.name,
    this.token,
    this.refreshToken,
  });

  final String id;
  final String email;
  final String name;
  final String? token;
  final String? refreshToken;

  @override
  List<Object?> get props => [id, email, name, token, refreshToken];
}
