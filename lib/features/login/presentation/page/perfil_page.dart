// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rd_social/features/login/presentation/bloc/cerrar_sesion/cerrar_sesion_bloc.dart';
import 'package:rd_social/features/login/presentation/page/login_page.dart';

import '../../domain/entities/usuario.dart';
import '../bloc/inicio_sesion/inicio_sesion_bloc.dart';

class PerfilPage extends StatefulWidget {
  const PerfilPage({super.key});

  @override
  State<PerfilPage> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  @override
  void initState() {
    obtenerPerfilUsuario();
    super.initState();
  }

  Usuario? usuario;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(240, 240, 240, 1),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: const BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 4),
                            blurRadius: 14,
                            color: Color.fromRGBO(0, 0, 0, 0.250))
                      ]),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: (usuario != null)
                        ? Image.network(
                            usuario!.foto,
                            fit: BoxFit.cover,
                          )
                        : const Center(),
                  ),
                ),
              ),
              SizedBox(
                width: 350,
                height: 60,
                child: (usuario != null)
                    ? Text(
                        usuario!.nombre,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.clip,
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                          color: const Color.fromRGBO(63, 151, 255, 1),
                        ),
                      )
                    : const Center(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 90, bottom: 50),
                child: SizedBox(
                  width: 330,
                  height: 100,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 40,
                            height: 20,
                            child: SvgPicture.asset(
                                'assets/images_icons_perfil/arroba.svg'),
                          ),
                          Container(
                            width: 290,
                            alignment: Alignment.centerLeft,
                            height: 50,
                            child: (usuario != null)
                                ? Text(
                                    (usuario!.email.isNotEmpty)
                                        ? usuario!.email
                                        : 'Sin correo electronico',
                                    style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color:
                                          const Color.fromRGBO(63, 151, 255, 1),
                                    ),
                                  )
                                : const Center(
                                    child: Text('Sin información'),
                                  ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 40,
                            height: 20,
                            child: SvgPicture.asset(
                                'assets/images_icons_perfil/telefono.svg'),
                          ),
                          Container(
                            width: 290,
                            alignment: Alignment.centerLeft,
                            height: 50,
                            child: (usuario != null)
                                ? Text(
                                    (usuario!.numero.isNotEmpty)
                                        ? usuario!.numero
                                        : 'Sin numero telefónico',
                                    style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color:
                                          const Color.fromRGBO(63, 151, 255, 1),
                                    ),
                                  )
                                : const Text('Sin información'),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Container(
                width: 100,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const <BoxShadow>[
                      BoxShadow(
                        offset: Offset(0, 4),
                        blurRadius: 18,
                        color: Color.fromRGBO(0, 0, 0, 0.050),
                      )
                    ]),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: const Color.fromRGBO(240, 240, 240, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () async {
                      bool scsCerrada =
                          await context.read<CerrarSesionBloc>().cerrarSesion();
                      if (scsCerrada) {
                        Route route = MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        );
                        Navigator.pushAndRemoveUntil(
                            context, route, (Route<dynamic> route) => false);
                      }
                    },
                    child: const Icon(Icons.exit_to_app_rounded)),
              )
            ],
          ),
        ));
  }

  obtenerPerfilUsuario() async {
    List<Usuario> user =
        await context.read<InicioSesionBloc>().obtnerDatosUsuarioLocal();
    setState(() {
      usuario = Usuario(
          nombre: user[0].nombre,
          email: user[0].email,
          numero: user[0].numero,
          foto: user[0].foto,
          id: user[0].id);
    });
  }
}
