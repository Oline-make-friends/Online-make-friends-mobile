// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'package:flutter_making_friends_app_2/screens/screens.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final PreferredSizeWidget? bottom;
  final Widget? leading;
  const CustomAppBar({
    Key? key,
    this.bottom,
    this.leading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 50,
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      automaticallyImplyLeading: false,
      bottom: bottom,
      title: InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/bottomNav');
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('F',
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(fontWeight: FontWeight.bold)),
            // const SizedBox(width: 5),
            Text(
              'Study',
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
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/friends');
          },
          icon: FaIcon(
            FontAwesomeIcons.solidMessage,
            color: Theme.of(context).primaryColor,
          ),
        ),
        // IconButton(
        //   onPressed: () {
        //     Get.to(TestScreen(), arguments: Get.arguments);
        //   },
        //   icon: FaIcon(
        //     FontAwesomeIcons.warning,
        //     color: Theme.of(context).primaryColor,
        //   ),
        // ),
      ],
      leading: leading,
    );
  }

  @override
  Size get preferredSize =>
      bottom != null ? const Size.fromHeight(100) : const Size.fromHeight(50);
}
