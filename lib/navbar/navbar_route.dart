import 'package:flutter/material.dart';
import 'package:rd_social/route/route_navbar.dart';

import 'navbar.dart';

class NavbarRoute extends StatefulWidget {
  const NavbarRoute({super.key});

  @override
  State<NavbarRoute> createState() => _NavbarRouteState();
}

class _NavbarRouteState extends State<NavbarRoute> {
  int index = 0;
  NavBar? navBar;

  @override
  void initState() {
    navBar = NavBar(currentIndex: (i) {
      setState(() {
        index = i;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: navBar,
      body: RouteNavbar(index: index),
    );
  }
}
