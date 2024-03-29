import 'package:flutter/material.dart';
import 'package:mini_project_menara_indonesia/View/comiclist/popular.dart';
import 'package:mini_project_menara_indonesia/View/comiclist/recommend.dart';

import '../View/comiclist/homepagev2.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int currenticon = 0;
  final screen = [
    const Home(),
    const PopularComics(),
    const RecommendComics(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currenticon,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: Colors.blue.shade300,
          unselectedItemColor: Color.fromRGBO(205, 205, 205, 1),
          onTap: (value) {
            setState(() {
              currenticon = value;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/images/comic.png",
                scale: 17,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/images/fire.png",
                scale: 17,
              ),
              label: "Popular",
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/images/stars.png",
                scale: 17,
              ),
              label: "Recommend",
            ),
          ]),
      body: screen[currenticon],
    );
  }
}
