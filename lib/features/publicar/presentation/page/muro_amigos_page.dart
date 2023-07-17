// ignore_for_file: deprecated_member_use

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rd_social/features/login/data/models/usuario_model.dart';
import 'package:rd_social/features/login/domain/entities/usuario.dart';
import 'package:rd_social/features/publicar/presentation/bloc/rd_publicacion/rd_publicacion_bloc.dart';
import 'package:rd_social/features/publicar/presentation/page/card_publicacion_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'crear_publicacion_page.dart';

class MuroAmigosPage extends StatefulWidget {
  const MuroAmigosPage({super.key});

  @override
  State<MuroAmigosPage> createState() => _MuroAmigosPageState();
}

class _MuroAmigosPageState extends State<MuroAmigosPage> {
  @override
  void initState() {
    context.read<RdPublicacionBloc>().add(ObtenerPublicaciones());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(240, 240, 240, 1),
      appBar: AppBar(
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 180,
                  child: Text(
                    'RDSocial',
                    style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
                  height: 50,
                  child: SvgPicture.asset(
                    'assets/navbar_images_icons/world.svg',
                    width: 10,
                    height: 10,
                    alignment: Alignment.topCenter,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 40,
              decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(9),
                  bottomRight: Radius.circular(9),
                ),
              ),
              child: InkWell(
                onTap: () {
                  Route route = MaterialPageRoute(
                      builder: (context) => const CrearPublicaconPage());
                  Navigator.push(context, route);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Nueva publicación',
                      style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ),
                    Container(
                      height: 20,
                      padding: const EdgeInsets.only(left: 2),
                      child: SvgPicture.asset(
                        'assets/crear_publicacion.svg',
                        alignment: Alignment.topCenter,
                        width: 15,
                        height: 15,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
            RefreshIndicator(
              onRefresh: () async {
                context.read<RdPublicacionBloc>().add(ObtenerPublicaciones());
              },
              child: SizedBox(
                width: 340,
                height: 520,
                child: BlocBuilder<RdPublicacionBloc, RdPublicacionState>(
                  builder: (context, state) {
                    if (state is RdObteniendoPublicacionesAmigos) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is RdPublicacionesObtenidasAmigos) {
                      return CardPublicacionPage(
                          publicaciones: state.publicaciones);
                    } else if (state is ErrorGetPublicacion) {
                      return Center(
                        child: Text(state.error),
                      );
                    } else {
                      return Center(
                        child: ElevatedButton(
                            onPressed: () async {
                              context
                                  .read<RdPublicacionBloc>()
                                  .add(ObtenerPublicaciones());
                            },
                            child: const Text('dasds')),
                      );
                    }
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  extraerDatos<String>() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var usersString = sharedPreferences.getString('usuario') ?? "[]";
    Usuario user = jsonDecode(usersString)
        .map<UsuarioModel>((data) => UsuarioModel.fromJson(data))
        .toList();
    debugPrint(user.id);
    return user.id;
  }
}
