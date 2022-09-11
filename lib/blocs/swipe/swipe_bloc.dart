import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_making_friends_app_2/models/models.dart';

part 'swipe_event.dart';
part 'swipe_state.dart';

class SwipeBloc extends Bloc<SwipeEvent, SwipeState> {
  SwipeBloc() : super(SwipeLoading()) {
    on<LoadUser>(_onLoadUsers);
    on<SwipeLeft>(_onSwipeLeft);
    on<SwipeRight>(_onSwipeRight);
  }
  void _onLoadUsers(LoadUser event, Emitter<SwipeState> emit) {
    emit(SwipeLoaded(users: event.users));
  }

  void _onSwipeLeft(SwipeLeft event, Emitter<SwipeState> emit) {
    if (state is SwipeLoaded) {
      final state = this.state as SwipeLoaded;
      try {
        emit(SwipeLoaded(users: List.from(state.users)..remove(event.user)));
      } catch (_) {}
    }
  }

  void _onSwipeRight(SwipeRight event, Emitter<SwipeState> emit) {
    if (state is SwipeLoaded) {
      final state = this.state as SwipeLoaded;
      try {
        emit(SwipeLoaded(users: List.from(state.users)..remove(event.user)));
      } catch (_) {}
    }
  }
}
