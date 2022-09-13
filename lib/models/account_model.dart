// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Account extends Equatable {
  final int id;
  final String username;
  final String password;
  final bool is_admin;
  final bool is_active;

  const Account({
    required this.id,
    required this.username,
    required this.password,
    this.is_admin = false,
    this.is_active = false,
  });

  @override
  List<Object> get props {
    return [
      id,
      username,
      password,
      is_admin,
      is_active,
    ];
  }

  static List<Account> accounts = [
    Account(
      id: 1,
      username: 'an',
      password: '123456',
    ),
    Account(
      id: 2,
      username: 'nam',
      password: '123456',
    ),
    Account(
      id: 1,
      username: 'user1',
      password: '123456',
    ),
  ];
}
