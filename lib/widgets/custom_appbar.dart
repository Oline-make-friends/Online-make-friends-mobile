import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('META',
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(fontWeight: FontWeight.bold)),
          // const SizedBox(width: 5),
          Text(
            'MATCH',
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(color: Colors.black54),
          )
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/noti');
          },
          icon: FaIcon(
            FontAwesomeIcons.solidBell,
            color: Theme.of(context).primaryColor,
          ),
        ),
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/news');
          },
          icon: FaIcon(
            FontAwesomeIcons.newspaper,
            color: Theme.of(context).primaryColor,
          ),
        ),
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/matches');
          },
          icon: FaIcon(
            FontAwesomeIcons.solidMessage,
            color: Theme.of(context).primaryColor,
          ),
        ),
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/profile');
          },
          icon: FaIcon(
            FontAwesomeIcons.userLarge,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
