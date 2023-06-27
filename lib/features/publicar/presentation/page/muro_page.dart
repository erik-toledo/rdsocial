// ignore_for_file: deprecated_member_use, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rd_social/features/publicar/presentation/page/card_publicacion_page.dart';
import '../../../login/domain/entities/usuario.dart';
import '../../../login/presentation/bloc/inicio_sesion/inicio_sesion_bloc.dart';
import '../bloc/rd_publicacion/rd_publicacion_bloc.dart';

class MuroPage extends StatefulWidget {
  const MuroPage({super.key});

  @override
  State<MuroPage> createState() => _MuroPageState();
}

class _MuroPageState extends State<MuroPage> {
  String id = "";
  @override
  void initState() {
    obtenerId();
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
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              RefreshIndicator(
                onRefresh: () async {
                  context
                      .read<RdPublicacionBloc>()
                      .add(GetPublicacion(idUsuario: id));
                },
                child: SizedBox(
                  width: 340,
                  height: 530,
                  child: BlocBuilder<RdPublicacionBloc, RdPublicacionState>(
                    builder: (context, state) {
                      if (state is RdObteniendoPublicaciones) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is RdPublicacionesObtenidas) {
                        return CardPublicacionPage(
                            publicaciones: state.publicacionesMuro);
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
      ),
    );
  }

  obtenerId() async {
    List<Usuario> user =
        await context.read<InicioSesionBloc>().obtnerDatosUsuarioLocal();
    setState(() {
      id = user[0].id.toString();
    });
    context
        .read<RdPublicacionBloc>()
        .add(GetPublicacion(idUsuario: user[0].id.toString()));
  }
}
