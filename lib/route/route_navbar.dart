import 'package:flutter/material.dart';
import 'package:rd_social/features/login/presentation/page/perfil_page.dart';
import 'package:rd_social/features/publicar/presentation/page/mapa_page.dart';
import 'package:rd_social/features/publicar/presentation/page/muro_page.dart';

import '../features/publicar/presentation/page/muro_amigos_page.dart';

class RouteNavbar extends StatelessWidget {
  final int index;
  const RouteNavbar({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    List<Widget> views = const [
      MuroAmigosPage(),
      MuroPage(),
      MapaPage(),
      PerfilPage(),
    ];
    return views[index];
  }
}
