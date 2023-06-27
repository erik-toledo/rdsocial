// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rd_social/navbar/navbar_route.dart';

import '../bloc/inicio_sesion/inicio_sesion_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final correoController = TextEditingController();
  final contrasenaController = TextEditingController();
  bool showPass = false;
  bool isLoged = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(240, 240, 240, 1),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: SizedBox(
                  width: double.infinity,
                  height: 90,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.bottomCenter,
                        width: 209,
                        height: double.infinity,
                        child: Text(
                          'RDSocial',
                          style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(63, 151, 255, 1),
                              shadows: <Shadow>[
                                Shadow(
                                  offset: Offset(0, 4),
                                  color: Color.fromRGBO(160, 148, 148, 0.279),
                                  blurRadius: 10,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 15,
                        height: 50,
                        alignment: Alignment.topCenter,
                        child: SvgPicture.asset(
                          'assets/navbar_images_icons/world.svg',
                          // ignore: deprecated_member_use
                          color: const Color.fromRGBO(63, 151, 255, 1),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 200,
                child: Stack(
                  children: [
                    Positioned(
                      right: -45,
                      bottom: -170,
                      child: SizedBox(
                        height: 500,
                        child: SvgPicture.asset(
                          'assets/images_logo/logo2.svg',
                          height: 450,
                          alignment: Alignment.topCenter,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Container(
                        width: 200,
                        height: 50,
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(63, 151, 255, 1),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              offset: Offset(0, 5),
                              blurRadius: 30,
                              color: Color.fromRGBO(0, 0, 0, 0.157),
                            )
                          ],
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: ElevatedButton(
                          onPressed: () async {
                            debugPrint("antes ${isLoged.toString()}");
                            isLoged = await context
                                .read<InicioSesionBloc>()
                                .iniciosesion("L");
                            if (isLoged) {
                              Route route = MaterialPageRoute(
                                  builder: (context) => const NavbarRoute());
                              Navigator.pushAndRemoveUntil(context, route,
                                  (Route<dynamic> route) => false);
                            } else {}
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor:
                                const Color.fromRGBO(63, 151, 255, 1),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                width: 90,
                                child: Text(
                                  "Iniciar con ",
                                  style: GoogleFonts.montserrat(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                child: SvgPicture.asset(
                                  'assets/images_logo/google.svg',
                                  width: 30,
                                  // ignore: deprecated_member_use
                                  color: Colors.white,
                                  alignment: Alignment.centerLeft,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Container(
                        width: 200,
                        height: 50,
                        decoration: const BoxDecoration(
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              offset: Offset(0, 5),
                              blurRadius: 30,
                              color: Color.fromRGBO(0, 0, 0, 0.157),
                            )
                          ],
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: ElevatedButton(
                          onPressed: () async {
                            isLoged = await context
                                .read<InicioSesionBloc>()
                                .iniciosesion("R");
                            if (isLoged) {
                              Route route = MaterialPageRoute(
                                  builder: (context) => const NavbarRoute());
                              Navigator.pushAndRemoveUntil(context, route,
                                  (Route<dynamic> route) => false);
                            } else {}
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: Colors.green,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                width: 120,
                                child: Text(
                                  "Registrate con ",
                                  style: GoogleFonts.montserrat(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                child: SvgPicture.asset(
                                  'assets/images_logo/google.svg',
                                  width: 30,
                                  // ignore: deprecated_member_use
                                  color: Colors.white,
                                  alignment: Alignment.centerLeft,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
