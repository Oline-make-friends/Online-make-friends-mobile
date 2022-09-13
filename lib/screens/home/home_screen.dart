// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../blocs/swipe/swipe_bloc.dart';
import '../../models/models.dart';
import '../../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';

  static Route route() {
    return MaterialPageRoute(
      builder: (context) => const HomeScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: BlocBuilder<SwipeBloc, SwipeState>(
        builder: (context, state) {
          if (state is SwipeLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is SwipeLoaded) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  InkWell(
                    onDoubleTap: () {
                      Navigator.pushNamed(context, '/users',
                          arguments: state.users[0]);
                    },
                    child: Draggable(
                      feedback: UserCard(user: state.users[0]),
                      child: UserCard(user: state.users[0]),
                      childWhenDragging: UserCard(user: state.users[1]),
                      onDragEnd: (drag) {
                        if (drag.velocity.pixelsPerSecond.dx < 0) {
                          context.read<SwipeBloc>()
                            ..add(SwipeLeft(user: state.users[0]));
                        } else {
                          context.read<SwipeBloc>()
                            ..add(SwipeLeft(user: state.users[0]));
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 60.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ChoiceButton(
                          color: Theme.of(context).errorColor,
                          icon: Icons.clear_rounded,
                        ),
                        ChoiceButton(
                            width: 80,
                            height: 80,
                            size: 30,
                            color: Colors.white,
                            hasGradient: true,
                            icon: FontAwesomeIcons.handshakeSimple),
                        ChoiceButton(
                          color: Theme.of(context).accentColor,
                          icon: Icons.watch_later,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Text('error');
          }
        },
      ),
    );
  }
}
