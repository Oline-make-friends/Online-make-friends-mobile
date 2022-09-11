// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'swipe_bloc.dart';

abstract class SwipeState extends Equatable {
  const SwipeState();

  @override
  List<Object> get props => [];
}

class SwipeLoading extends SwipeState {}

class SwipeLoaded extends SwipeState {
  final List<User> users;
  const SwipeLoaded({
    required this.users,
  });

  @override
  List<Object> get props => [users];
}

class SwipeError extends SwipeState {}
