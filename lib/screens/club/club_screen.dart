// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_making_friends_app_2/widgets/custom_appbar.dart';

class ClubScreen extends StatelessWidget {
  const ClubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Explore',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  Text(
                    'all clubs',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  Text(
                    'Find your favorite clubs',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(color: Colors.black54),
                  )
                ],
              ),
            ),

            //!pins row
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    FilterChip(
                      label: const Text('Programming'),
                      avatar: Icon(Icons.schedule),
                      onSelected: (value) {},
                    ),
                    const SizedBox(width: 10),
                    FilterChip(
                      label: const Text('Activities'),
                      avatar: Icon(Icons.abc),
                      onSelected: (value) {},
                    ),
                    const SizedBox(width: 10),
                    FilterChip(
                      label: const Text('Sport'),
                      avatar: Icon(Icons.abc),
                      onSelected: (value) {},
                    ),
                    const SizedBox(width: 10),
                    FilterChip(
                      label: const Text('Design'),
                      avatar: Icon(Icons.abc),
                      onSelected: (value) {},
                    ),
                    const SizedBox(width: 10),
                    FilterChip(
                      label: const Text('Backpacking'),
                      avatar: Icon(Icons.abc),
                      onSelected: (value) {},
                    ),
                    const SizedBox(width: 10),
                    FilterChip(
                      label: const Text('Gaming'),
                      avatar: Icon(Icons.abc),
                      onSelected: (value) {},
                    ),
                    const SizedBox(width: 10),
                  ],
                ),
              ),
            ),

            //!search container
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                // border: Border.all(),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.search),
                  ),
                  Flexible(
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: 'Search for club',
                          border: InputBorder.none),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //!popular
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Popular Clubs',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_right_alt,
                          size: 30,
                        ),
                      ),
                    ],
                  ),

                  //! clubs row
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ClubContainer(
                          name: 'Java',
                          category: 'Programming',
                          coverImg:
                              'https://images.unsplash.com/photo-1605379399642-870262d3d051?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1206&q=80',
                        ),
                        const SizedBox(width: 20),
                        ClubContainer(
                          name: 'C#',
                          category: 'Programming',
                          coverImg:
                              'https://images.unsplash.com/photo-1605379399642-870262d3d051?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1206&q=80',
                        ),
                        const SizedBox(width: 20),
                        ClubContainer(
                          name: 'Soccer',
                          category: 'Activities',
                          coverImg:
                              'https://images.unsplash.com/photo-1552674605-db6ffd4facb5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
                        ),
                        const SizedBox(width: 20),
                        ClubContainer(
                          name: 'Adobe PS',
                          category: 'Design',
                          coverImg:
                              'https://images.unsplash.com/photo-1475669698648-2f144fcaaeb1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
                        ),
                        const SizedBox(width: 20),
                      ],
                    ),
                  ),

                  //!joined
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Your Clubs',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      IconButton(
                        onPressed: () {
                          print('pressed');
                        },
                        icon: Icon(
                          Icons.arrow_right_alt,
                          size: 30,
                        ),
                      ),
                    ],
                  ),

                  //! clubs row
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ClubContainer(
                          name: 'Java',
                          category: 'Programming',
                          coverImg:
                              'https://images.unsplash.com/photo-1605379399642-870262d3d051?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1206&q=80',
                        ),
                        const SizedBox(width: 20),
                        ClubContainer(
                          name: 'Soccer',
                          category: 'Activities',
                          coverImg:
                              'https://images.unsplash.com/photo-1552674605-db6ffd4facb5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
                        ),
                        const SizedBox(width: 20),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ClubContainer extends StatelessWidget {
  final String name;
  final String coverImg;
  final String category;
  const ClubContainer({
    Key? key,
    required this.name,
    required this.coverImg,
    required this.category,
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
                  '52 members ',
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
