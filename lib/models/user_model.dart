// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int id;
  final String name;
  final int age;
  final List<String> imageUrls;
  final List<String> interests;
  final String bio;
  final String jobTitle;

  const User({
    required this.id,
    required this.name,
    required this.age,
    required this.imageUrls,
    required this.interests,
    required this.bio,
    required this.jobTitle,
  });

  @override
  List<Object> get props {
    return [
      id,
      name,
      age,
      imageUrls,
      bio,
      jobTitle,
    ];
  }

  static List<User> users = const [
    User(
      id: 0,
      name: 'Beluga',
      age: 3,
      imageUrls: [
        'https://static.wikia.nocookie.net/beluga/images/9/99/Beluga_d.png/revision/latest?cb=20211229190719',
        'https://i.ytimg.com/vi/C1CuiP2xvVs/maxresdefault.jpg',
        'https://i.ytimg.com/vi/ikwG466kQlo/maxresdefault.jpg',
        'https://i1.sndcdn.com/avatars-hzXBVKIiq1Upmrj0-GlzQog-t500x500.jpg',
      ],
      interests: ['Game', 'Technology', 'Music'],
      bio: "Ka-hoot destroyer, Roblux hacker, skittle-chan lover, Mods hater",
      jobTitle: 'Discord CEO',
    ),
    User(
      id: 1,
      name: 'Hecker',
      age: 15,
      imageUrls: [
        'https://yt3.ggpht.com/arWtsAqaTamuoTbdT2z-QXL121Qbv80wbsOE_1ty6I98JV3ocpKmfZ3A-UcyAVKiqikznFpc=s900-c-k-c0x00ffffff-no-rj',
        'https://i.imgflip.com/5lqwao.jpg',
        'https://exploringbits.com/wp-content/uploads/2021/09/baby-hecker-pfp.jpg?ezimgfmt=rs:352x351/rscb3/ng:webp/ngcb3',
        'https://static.wikia.nocookie.net/youtube/images/f/fb/Heckler.jpg/revision/latest?cb=20210902045825'
      ],
      interests: ['Game', 'Technology', 'Music'],
      bio:
          "Initially a hacker who originally threatens Beluga, he later gradually becomes one of the latter's best friends once Skittle disappears, as the videos go.",
      jobTitle: 'Job Title Here',
    ),
    User(
      id: 2,
      name: 'Skittle',
      age: 3,
      imageUrls: [
        'https://static.wikia.nocookie.net/beluga/images/f/f6/Skittle.jpg/revision/latest?cb=20210730213705',
        'https://static.wikia.nocookie.net/beluga/images/7/75/VladimirPic.png/revision/latest?cb=20211021052158',
        'https://exploringbits.com/wp-content/uploads/2021/09/Vladimire%CC%81-PFP-discord.jpg?ezimgfmt=rs:352x391/rscb3/ng:webp/ngcb3',
        'https://static.wikia.nocookie.net/beluga/images/3/3d/Skittle_Jr..png/revision/latest/scale-to-width-down/656?cb=20220426170352',
      ],
      interests: ['Game', 'Technology', 'Music'],
      bio:
          "Beluga's best friend after encountering Lester. Later in the videos, Beluga was suffering from memory loss due to Lester's meddling, however, Hecker used his hacking skills to restore his memories along with skittles,[7] skittle has since made a return.",
      jobTitle: 'Job Title Here',
    ),
    User(
      id: 3,
      name: 'Scemmer',
      age: 20,
      imageUrls: [
        'https://static.wikia.nocookie.net/beluga/images/b/b1/ScemerPic.png/revision/latest?cb=20211225164758',
        'https://static.wikia.nocookie.net/beluga/images/b/b1/ScemerPic.png/revision/latest?cb=20211225164758',
        'https://static.wikia.nocookie.net/beluga/images/b/b1/ScemerPic.png/revision/latest?cb=20211225164758',
        'https://static.wikia.nocookie.net/beluga/images/b/b1/ScemerPic.png/revision/latest?cb=20211225164758',
      ],
      interests: ['Game', 'Technology', 'Music'],
      bio: 'A scemmer cat',
      jobTitle: 'Job Title Here',
    ),
    User(
      id: 4,
      name: 'Eugene',
      age: 21,
      imageUrls: [
        'https://static.wikia.nocookie.net/beluga/images/2/2d/Eugene.png/revision/latest/top-crop/width/360/height/450?cb=20210904195805',
        'https://static.wikia.nocookie.net/beluga/images/2/2d/Eugene.png/revision/latest/top-crop/width/360/height/450?cb=20210904195805',
        'https://static.wikia.nocookie.net/beluga/images/2/2d/Eugene.png/revision/latest/top-crop/width/360/height/450?cb=20210904195805',
        'https://static.wikia.nocookie.net/beluga/images/2/2d/Eugene.png/revision/latest/top-crop/width/360/height/450?cb=20210904195805',
      ],
      interests: ['Game', 'Technology', 'Music'],
      bio:
          "A moderator on Discord. Because of his bald head, Beluga regularly compares him to an egg.",
      jobTitle: 'Job Title Here',
    ),
    User(
      id: 5,
      name: 'Lester',
      age: 22,
      imageUrls: [
        'https://static.wikia.nocookie.net/beluga/images/a/a3/Idk.webp/revision/latest/top-crop/width/360/height/450?cb=20211231211102',
        'https://static.wikia.nocookie.net/beluga/images/a/a3/Idk.webp/revision/latest/top-crop/width/360/height/450?cb=20211231211102',
        'https://static.wikia.nocookie.net/beluga/images/a/a3/Idk.webp/revision/latest/top-crop/width/360/height/450?cb=20211231211102',
        'https://static.wikia.nocookie.net/beluga/images/a/a3/Idk.webp/revision/latest/top-crop/width/360/height/450?cb=20211231211102',
      ],
      interests: ['Game', 'Technology', 'Music'],
      bio:
          "A moderator on Discord and owner of the Lester's Minivan server.[6] He appears to be an assailant, as Skittle vanished after meeting him, and he appears to have a one-sided connection with Skittle-Chan.",
      jobTitle: 'Job Title Here',
    ),
    User(
      id: 6,
      name: 'Pablo',
      age: 26,
      imageUrls: [
        'https://static.wikia.nocookie.net/beluga/images/9/99/Pablo.jpg/revision/latest/top-crop/width/360/height/450?cb=20210730192800',
        'https://static.wikia.nocookie.net/beluga/images/9/99/Pablo.jpg/revision/latest/top-crop/width/360/height/450?cb=20210730192800',
        'https://static.wikia.nocookie.net/beluga/images/9/99/Pablo.jpg/revision/latest/top-crop/width/360/height/450?cb=20210730192800',
        'https://static.wikia.nocookie.net/beluga/images/9/99/Pablo.jpg/revision/latest/top-crop/width/360/height/450?cb=20210730192800',
      ],
      interests: ['Game', 'Technology', 'Music'],
      bio:
          "Initially a Discord moderator, later shown him to be an admin/server owner of Pablo's Pub. He once fell in love with Pepper.[5]",
      jobTitle: 'Job Title Here',
    ),
  ];
}
