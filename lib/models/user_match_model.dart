// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:flutter_making_friends_app_2/models/models.dart';

class UserMatch extends Equatable {
  final int id;
  final int userId;
  final UserModel matchedUser;
  final List<Chat>? chats;

  const UserMatch({
    required this.id,
    required this.userId,
    required this.matchedUser,
    required this.chats,
  });

  @override
  List<Object> get props => [id, userId, matchedUser];

  static List<UserMatch> matches = [
    UserMatch(
      id: 1,
      userId: 1,
      matchedUser: UserModel.users[1],
      chats: Chat.chats
          .where((chat) => chat.userId == 1 && chat.matchedUserId == 2)
          .toList(),
    ),
    UserMatch(
      id: 2,
      userId: 1,
      matchedUser: UserModel.users[2],
      chats: Chat.chats
          .where((chat) => chat.userId == 1 && chat.matchedUserId == 3)
          .toList(),
    ),
    UserMatch(
      id: 3,
      userId: 1,
      matchedUser: UserModel.users[3],
      chats: Chat.chats
          .where((chat) => chat.userId == 1 && chat.matchedUserId == 4)
          .toList(),
    ),
    UserMatch(
      id: 4,
      userId: 1,
      matchedUser: UserModel.users[4],
      chats: Chat.chats
          .where((chat) => chat.userId == 1 && chat.matchedUserId == 5)
          .toList(),
    ),
  ];
}
