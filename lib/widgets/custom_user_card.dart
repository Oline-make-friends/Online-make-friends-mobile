import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/models.dart';
import '../screens/screens.dart';

class CustomUserCard extends StatelessWidget {
  const CustomUserCard({
    Key? key,
    required this.currentUser,
  }) : super(key: key);

  final UserModel currentUser;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Theme.of(context).primaryColor.withAlpha(40),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(currentUser.avatarUrl!),
                  radius: 40,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    onPressed: () {
                      Get.to(UpdateProfileScreen(), arguments: currentUser);
                    },
                    icon: Icon(Icons.edit),
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            Text(
              currentUser.fullname!,
              style: Theme.of(context).textTheme.headline5,
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.location_on,
                  size: 15,
                  color: Theme.of(context).primaryColor.withAlpha(70),
                ),
                Text(currentUser.location!),
              ],
            ),
            const SizedBox(height: 5),
            Text(
              currentUser.about!,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Text(
                  '${currentUser.follows!.length}',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(width: 5),
                Text(
                  'Following',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
            const SizedBox(height: 10),
            Wrap(
              children: currentUser.interests!
                  .map(
                    (interest) => Card(
                      elevation: 0,
                      color: Theme.of(context).primaryColor.withAlpha(40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        child: Text(
                          interest,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
