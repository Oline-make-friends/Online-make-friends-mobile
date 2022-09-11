// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../widgets/widgets.dart';

final List<String> imgList = [
  'assets/friends.png',
  'assets/friends3.png',
  // 'assets/friends4.png',
  'assets/friends5.png',
];

class SplashScreen extends StatelessWidget {
  static const String routeName = '/splash';

  static Route route() {
    return MaterialPageRoute(
      builder: (context) => const SplashScreen(),
      settings: const RouteSettings(),
    );
  }

  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = imgList
        .map((item) => Stack(
              children: [
                Center(
                  child: Image.asset(item,
                      fit: BoxFit.fitWidth, width: double.infinity),
                ),
              ],
            ))
        .toList();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
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
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: CarouselSlider(
              options: CarouselOptions(
                aspectRatio: 1.5,
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
                autoPlay: true,
                autoPlayCurve: Curves.linearToEaseOut,
              ),
              items: imageSliders,
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  'Find Your',
                  style: Theme.of(context).textTheme.headline1!.copyWith(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Partner',
                      style: Theme.of(context).textTheme.headline1!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'With Us',
                      style: Theme.of(context).textTheme.headline1!.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  'Join us and socialize with',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: Colors.black54,
                      ),
                ),
                Text(
                  'millions of people',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: Colors.black54,
                      ),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                  buttonColor: Theme.of(context).primaryColor,
                  title: 'Find Someone',
                  onTap: () {
                    showMaterialModalBottomSheet(
                      context: context,
                      builder: ((context) {
                        return SafeArea(
                          child: Scaffold(
                            body: Container(
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                ),
                              ),
                              height: 700,
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: const Icon(Icons.close),
                                    ),
                                    Container(
                                      height: 200,
                                      width: 400,
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                          image:
                                              AssetImage('assets/friends2.png'),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Column(
                                        children: [
                                          const CustomTextFormField(
                                            hintTxt: 'Username or email',
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          const CustomTextFormField(
                                              hintTxt: 'Password'),
                                          const SizedBox(height: 20),
                                          SizedBox(
                                            width: double.infinity,
                                            child: IntrinsicWidth(
                                              child: CustomButton(
                                                  onTap: () {
                                                    Navigator.pushNamed(
                                                        context, '/home');
                                                  },
                                                  title: 'Login Now',
                                                  buttonColor: Theme.of(context)
                                                      .primaryColor),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Center(
                                            child: Text(
                                              'Or',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          SizedBox(
                                            width: double.infinity,
                                            child: IntrinsicWidth(
                                              child: CustomButton(
                                                  onTap: () {
                                                    Navigator.of(context)
                                                        .pushNamed('/register');
                                                  },
                                                  title: 'Join us now !',
                                                  buttonColor: Colors.white54,
                                                  textColor:
                                                      const Color(0xFF116ddd)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
