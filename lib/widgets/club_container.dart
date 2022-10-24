// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ClubContainer extends StatelessWidget {
  final String name;
  final String coverImg;
  final String category;
  final int? numberOfMembers;
  const ClubContainer({
    Key? key,
    required this.name,
    required this.coverImg,
    required this.category,
    this.numberOfMembers = 52,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(15),
        // border: Border.all(),
      ),
      // height: 100,
      child: Column(
        children: [
          //!club name and image
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            height: 70,
            width: 250,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15)),
              image: DecorationImage(
                image: NetworkImage(coverImg),
                fit: BoxFit.cover,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //!club name
                    Text(
                      name,
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                          color: Colors.white, fontWeight: FontWeight.w900),
                    ),
                    //!category
                    Text(
                      category,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: Colors.white, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {
                    print('pressed');
                  },
                  icon: Icon(Icons.more_horiz),
                  color: Colors.white,
                )
              ],
            ),
          ),

          //!club member info
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withAlpha(40),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15)),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            width: 250,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Members',
                  style: Theme.of(context).textTheme.headline6,
                ),
                Text(
                  '$numberOfMembers members ',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(color: Colors.black54),
                ),
                const SizedBox(height: 10),
                Text(
                  'Posts',
                  style: Theme.of(context).textTheme.headline6,
                ),
                Text(
                  '100 and more posts',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(color: Colors.black54),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size.fromHeight(35),
                    elevation: 0,
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  onPressed: () {},
                  child: Text('Join'),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
