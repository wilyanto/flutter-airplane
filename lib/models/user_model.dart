import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  const UserModel({
    required this.id,
    required this.email,
    required this.name,
    this.hobby = '',
    this.balance = 0,
  });

  factory UserModel.fromJson(Map<String, dynamic> json, String id) => UserModel(
        id: id,
        email: json['email'] as String,
        name: json['name'] as String,
        hobby: json['hobby'] as String,
        balance: json['balance'] as int,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'hobby': hobby,
        'balanace': balance,
      };

  final String id;
  final String email;
  final String name;
  final String hobby;
  final int balance;

  @override
  List<Object?> get props => [id, email, name, hobby, balance];
}
