// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavBar extends StatefulWidget {
  final Function currentIndex;
  const NavBar({super.key, required this.currentIndex});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: index,
      onTap: (int i) {
        setState(() {});
        index = i;
        widget.currentIndex(i);
      },
      backgroundColor: const Color.fromRGBO(240, 240, 240, 1),
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.blueGrey,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/navbar_images_icons/friend.svg',
              color: (index == 0) ? Colors.blue : Colors.grey,
              width: 20,
              height: 20,
            ),
            label: 'Publicaciones'),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/navbar_images_icons/world.svg',
            color: (index == 1) ? Colors.blue : Colors.grey,
            width: 20,
            height: 20,
          ),
          label: 'Mis publicaciones',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/navbar_images_icons/user.svg',
            color: (index == 2) ? Colors.blue : Colors.grey,
            width: 20,
            height: 20,
          ),
          label: 'Perfil',
        )
      ],
    );
  }
}
