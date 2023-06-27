// ignore_for_file: must_be_immutable, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rd_social/features/comentario/domain/entities/comentario.dart';
import 'package:rd_social/features/comentario/presentation/page/comentario_item_page.dart';
import 'package:rd_social/features/comentario/presentation/page/comentario_page.dart';
import 'package:rd_social/features/reaccion/presentation/bloc/ud_bloc/ud_reaccion_bloc.dart';
import 'package:rd_social/features/reaccion/presentation/bloc/ud_bloc/ud_reaccion_event.dart';

import '../../../comentario/presentation/bloc/cr_comentario/cr_comentario_bloc.dart';
import '../../../login/domain/entities/usuario.dart';
import '../../../login/presentation/bloc/inicio_sesion/inicio_sesion_bloc.dart';
import '../../../reaccion/presentation/bloc/rc_bloc/reaccion_bloc.dart';
import '../../../reaccion/presentation/page/reaccion_page.dart';
import '../../domain/entities/obtener_publicacion.dart';
//import 'package:rd_social/features/publicar/domain/entities/obtener_publicacion.dart';

class PublicacionDetallePage extends StatefulWidget {
  Widget widget;
  ObtenerPublicacion obtenerPublicacion;
  PublicacionDetallePage(
      {super.key, required this.obtenerPublicacion, required this.widget});

  @override
  State<PublicacionDetallePage> createState() => _PublicacionDetallePageState();
}

class _PublicacionDetallePageState extends State<PublicacionDetallePage> {
  final controllerComentario = TextEditingController();
  String id = "";
  bool change = false;
  @override
  void initState() {
    extraerDatos();
    context.read<CrComentarioBloc>().add(PressObtenerComentarioButton(
        idUsuario: widget.obtenerPublicacion.idUsuario,
        idPublicacion: widget.obtenerPublicacion.idPublicacion));
    context.read<ReaccionBloc>().add(PressObtenerReacionesEvent(
        idUsuario: widget.obtenerPublicacion.idUsuario,
        idPublicacion: widget.obtenerPublicacion.idPublicacion));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(240, 240, 240, 1),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  width: 370,
                  height: 50,
                  child: IconButton(
                    onPressed: () {
                      context.read<CrComentarioBloc>().add(ReinicioEvent());
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_rounded),
                  ),
                ),
                SizedBox(
                  width: 340,
                  height: 440,
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: 100,
                        child: Row(
                          children: [
                            Container(
                              width: 90,
                              height: 90,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.amber,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image.network(
                                  widget.obtenerPublicacion.foto,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Column(
                                children: [
                                  SizedBox(
                                    width: 200,
                                    height: 35,
                                    child: Text(
                                      widget.obtenerPublicacion.nombre,
                                      style: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 195,
                                    height: 50,
                                    child: Text(
                                      widget.obtenerPublicacion.hora,
                                      style: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 15),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: SizedBox(
                          width: 340,
                          height: 50,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 300,
                                child: Text(
                                  widget.obtenerPublicacion.descripcion,
                                  style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Container(
                          width: 340,
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: widget.widget,
                        ),
                      ),
                      SizedBox(
                        width: 340,
                        height: 50,
                        child: Row(
                          children: [
                            BlocBuilder<ReaccionBloc, ReaccionState>(
                              builder: (context, state) {
                                if (state is ReaccionObtenida) {
                                  return InkWell(
                                    onTap: () async {
                                      setState(() {
                                        change = !change;
                                      });
                                      if (!change) {
                                        context.read<UdReaccionBloc>().add(
                                            PressEliminarReaccion(
                                                reaccion: state.reaccion));
                                      } else {
                                        context.read<UdReaccionBloc>().add(
                                            PressActualizarReaccion(
                                                reaccion: state.reaccion));
                                      }
                                      context.read<ReaccionBloc>().add(
                                          PressObtenerReacionesEvent(
                                              idUsuario: widget
                                                  .obtenerPublicacion.idUsuario,
                                              idPublicacion: widget
                                                  .obtenerPublicacion
                                                  .idPublicacion));
                                    },
                                    child: ReaccionPage(
                                      reaccion: state.reaccion,
                                      path: (!change)
                                          ? 'assets/images_reaccion_icons/reaccion.svg'
                                          : 'assets/images_reaccion_icons/reaccion2.svg',
                                      color:
                                          (!change) ? Colors.blue : Colors.red,
                                    ),
                                  );
                                } else if (state is ReaccionError) {
                                  return Center(
                                    child: SizedBox(
                                        width: 280,
                                        height: 70,
                                        child: Text(
                                          state.error,
                                        )),
                                  );
                                } else {
                                  return const Center();
                                }
                              },
                            ),
                            BlocBuilder<CrComentarioBloc, CrComentarioState>(
                              builder: (context, state) {
                                if (state is CrComentariosObtenidos) {
                                  return ComentarioItemPage(
                                    comentarios: state.comentarios,
                                  );
                                } else {
                                  return const Center();
                                }
                              },
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: 340,
                  height: 130,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(240, 240, 240, 1),
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(10.0)),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(210, 210, 210, 1),
                        offset: Offset(0.0, -.5),
                        blurRadius: 0,
                      ),
                    ],
                  ),
                  child: BlocBuilder<CrComentarioBloc, CrComentarioState>(
                    builder: (context, state) {
                      if (state is CrObteniendoComentarios ||
                          state is CrSavingComentario) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is CrComentariosObtenidos) {
                        return ComentarioPage(comentarios: state.comentarios);
                      } else if (state is CrErrorCreandoComentario) {
                        return Center(
                          child: Text(state.error),
                        );
                      } else if (state is CrErrorObteniendoComentarios) {
                        return Center(
                          child: Text(state.error),
                        );
                      } else {
                        return const Center();
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Container(
                    width: 340,
                    height: 60,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(227, 227, 227, 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 280,
                          child: TextField(
                            controller: controllerComentario,
                            textAlignVertical: TextAlignVertical.center,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: '\t\t\t\t\t\t\tAgregar comentario',
                              hintStyle: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                color: const Color.fromRGBO(180, 180, 180, 1),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 60,
                          height: 60,
                          child: IconButton(
                            onPressed: () async {
                              Comentario comentario = Comentario(
                                  comentario: controllerComentario.text,
                                  idPublicacion:
                                      widget.obtenerPublicacion.idPublicacion,
                                  idUsuario:
                                      widget.obtenerPublicacion.idUsuario,
                                  idUsuarioComentario: id);
                              context.read<CrComentarioBloc>().add(
                                  PressCreateComentarioButton(
                                      comentario: comentario));
                              context.read<CrComentarioBloc>().add(
                                  PressObtenerComentarioButton(
                                      idUsuario:
                                          widget.obtenerPublicacion.idUsuario,
                                      idPublicacion: widget
                                          .obtenerPublicacion.idPublicacion));
                              controllerComentario.clear();
                            },
                            icon: SvgPicture.asset(
                              'assets/images_icons_publicacion/send.svg',
                              fit: BoxFit.cover,
                              width: 70,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  extraerDatos() async {
    List<Usuario> user =
        await context.read<InicioSesionBloc>().obtnerDatosUsuarioLocal();
    setState(() {
      id = user[0].id.toString();
    });
  }
}
