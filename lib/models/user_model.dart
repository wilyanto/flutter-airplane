import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  const UserModel({
    required this.id,
    required this.email,
    this.name = '',
    this.hobby = '',
    this.balance = 0,
  });

  final String id;
  final String email;
  final String name;
  final String hobby;
  final int balance;

  @override
  List<Object?> get props => [id, email, name, hobby, balance];
}
