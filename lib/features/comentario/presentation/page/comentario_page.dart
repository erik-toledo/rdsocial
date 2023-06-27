import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rd_social/features/comentario/domain/entities/comentario_usuario.dart';

// ignore: must_be_immutable
class ComentarioPage extends StatefulWidget {
  List<ComentarioUsuario> comentarios;
  ComentarioPage({super.key, required this.comentarios});

  @override
  State<ComentarioPage> createState() => _ComentarioPageState();
}

class _ComentarioPageState extends State<ComentarioPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(240, 240, 240, 1),
      body: (widget.comentarios.isNotEmpty)
          ? ListView.builder(
              itemCount: widget.comentarios.length,
              itemBuilder: (context, index) {
                ComentarioUsuario comentarioUsuario = widget.comentarios[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: const BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle,
                          ),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.network(comentarioUsuario.foto)),
                        ),
                        SizedBox(
                          width: 200,
                          height: 50,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Column(
                              children: [
                                SizedBox(
                                  width: 200,
                                  height: 20,
                                  child: Text(
                                    comentarioUsuario.nombre,
                                    style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                        color: const Color.fromRGBO(
                                            101, 130, 160, 1)),
                                  ),
                                ),
                                SizedBox(
                                  width: 200,
                                  height: 25,
                                  child: Text(
                                    comentarioUsuario.comentario,
                                    style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15,
                                        color: const Color.fromRGBO(
                                            150, 150, 150, 1)),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            )
          : Center(
              child: Text(
                'Sin comentarios',
                style: GoogleFonts.nunito(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
    );
  }
}
