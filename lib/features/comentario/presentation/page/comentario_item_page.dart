// ignore_for_file: deprecated_member_use, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rd_social/features/comentario/domain/entities/comentario_usuario.dart';

class ComentarioItemPage extends StatefulWidget {
  List<ComentarioUsuario> comentarios;
  ComentarioItemPage({super.key, required this.comentarios});

  @override
  State<ComentarioItemPage> createState() => _ComentarioItemPageState();
}

class _ComentarioItemPageState extends State<ComentarioItemPage> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: SizedBox(
            width: 30,
            height: 30,
            child: SvgPicture.asset(
              'assets/images_reaccion_icons/comentario.svg',
              color: Colors.blue,
            ),
          ),
        ),
        Text(
          widget.comentarios.length.toString(),
          style: GoogleFonts.montserrat(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
