// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rd_social/features/reaccion/domain/entities/reaccion.dart';

class ReaccionPage extends StatefulWidget {
  final Reaccion reaccion;
  final String path;
  final Color color;
  const ReaccionPage(
      {super.key,
      required this.reaccion,
      required this.color,
      required this.path});

  @override
  State<ReaccionPage> createState() => _ReaccionPageState();
}

class _ReaccionPageState extends State<ReaccionPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 30,
          child: SvgPicture.asset(
            widget.path,
            color: widget.color,
          ),
        ),
        Text(
          widget.reaccion.cantidadReacciones,
          style: GoogleFonts.montserrat(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
