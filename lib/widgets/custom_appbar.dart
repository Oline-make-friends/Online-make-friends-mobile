import 'package:flutter/material.dart';
import 'package:flutter_making_friends_app_2/screens/screens.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final PreferredSizeWidget? bottom;
  const CustomAppBar({
    this.bottom,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      automaticallyImplyLeading: false,
      bottom: bottom,
      title: InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/bottomNav');
        },
        child: Row(
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
        // IconButton(
        //   onPressed: () {
        //     Navigator.pushNamed(context, '/news');
        //   },
        //   icon: FaIcon(
        //     FontAwesomeIcons.newspaper,
        //     color: Theme.of(context).primaryColor,
        //   ),
        // ),
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/friends');
          },
          icon: FaIcon(
            FontAwesomeIcons.solidMessage,
            color: Theme.of(context).primaryColor,
          ),
        ),
        IconButton(
          onPressed: () {
            Get.to(TestScreen(), arguments: Get.arguments);
          },
          icon: FaIcon(
            FontAwesomeIcons.warning,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize =>
      bottom != null ? const Size.fromHeight(100) : const Size.fromHeight(50);
}
