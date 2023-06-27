// ignore_for_file: deprecated_member_use, must_be_immutable

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rd_social/features/publicar/domain/entities/obtener_publicacion.dart';
import 'package:rd_social/features/publicar/presentation/page/publicacion_detalle_page.dart';
import 'package:video_player/video_player.dart';

class CardPublicacionPage extends StatefulWidget {
  List<ObtenerPublicacion> publicaciones;
  CardPublicacionPage({super.key, required this.publicaciones});

  @override
  State<CardPublicacionPage> createState() => _CardPublicacionPageState();
}

class _CardPublicacionPageState extends State<CardPublicacionPage> {
  VideoPlayerController? _videoPlayerController;
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool isPlay = false;
  bool playUaudio = false;
  @override
  void dispose() {
    _videoPlayerController?.dispose();
    _audioPlayer.dispose();
    super.dispose();
  }

  bool change = true;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 540,
      child: (widget.publicaciones.isNotEmpty)
          ? ListView.builder(
              itemCount: widget.publicaciones.length,
              itemBuilder: (context, index) {
                ObtenerPublicacion data = widget.publicaciones[index];
                return Padding(
                  padding: (index != (widget.publicaciones.length - 1))
                      ? const EdgeInsets.only(top: 10)
                      : const EdgeInsets.only(top: 10, bottom: 10),
                  child: InkWell(
                    onTap: () {
                      Route route = MaterialPageRoute(
                          builder: (context) => PublicacionDetallePage(
                                obtenerPublicacion: data,
                                widget: multimedia(data),
                              ));
                      Navigator.push(context, route);
                    },
                    child: Container(
                        width: 380,
                        height: 350,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(225, 225, 225, 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 4, top: 5),
                                  child: Container(
                                    width: 60,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(40),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(40),
                                      child: Image.network(data.foto),
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(left: 4),
                                  width: 150,
                                  height: 60,
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 25,
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          data.nombre,
                                          style: GoogleFonts.montserrat(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: double.infinity,
                                        alignment: Alignment.topLeft,
                                        height: 30,
                                        child: Text(
                                          data.hora,
                                          style: GoogleFonts.montserrat(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w300),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Container(
                              alignment: Alignment.bottomLeft,
                              width: 320,
                              height: 30,
                              child: Text(
                                data.descripcion,
                                style: GoogleFonts.roboto(
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                            Container(
                              width: 320,
                              height: 200,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              //Multimedia
                              child: multimedia(data),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: SizedBox(
                                width: 320,
                                height: 50,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 25,
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            change = !change;
                                          });
                                        },
                                        child: SvgPicture.asset(
                                          (change)
                                              ? 'assets/images_reaccion_icons/reaccion.svg'
                                              : 'assets/images_reaccion_icons/reaccion2.svg',
                                          color: (change)
                                              ? Colors.blue
                                              : Colors.red,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: SizedBox(
                                        width: 25,
                                        height: 25,
                                        child: SvgPicture.asset(
                                          'assets/images_reaccion_icons/comentario.svg',
                                          color: Colors.blue,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        )),
                  ),
                );
              },
            )
          : const Center(
              child: Text("Sin publicaciones"),
            ),
    );
  }

  Widget multimedia(ObtenerPublicacion obtenerPublicacion) {
    if (obtenerPublicacion.extencion == ".jpg" ||
        obtenerPublicacion.extencion == ".gif") {
      return ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          obtenerPublicacion.urlMultimedia,
          fit: BoxFit.cover,
        ),
      );
    } else if (obtenerPublicacion.extencion == ".mp4" &&
        _videoPlayerController != null) {
      return Stack(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: VideoPlayer(_videoPlayerController!)),
          Center(
            child: IconButton(
              onPressed: () {
                setState(() {
                  _videoPlayerController!.value.isPlaying
                      ? _videoPlayerController!.pause()
                      : _videoPlayerController!.play();
                  isPlay = !isPlay;
                });
              },
              icon: (isPlay)
                  ? const Icon(
                      Icons.pause_outlined,
                      color: Colors.blue,
                    )
                  : const Icon(
                      Icons.play_arrow_rounded,
                      color: Colors.blue,
                    ),
            ),
          )
        ],
      );
    } else if (_videoPlayerController == null) {
      return Container(
          width: 320,
          height: 200,
          decoration: BoxDecoration(
            color: const Color.fromARGB(83, 255, 255, 255),
            borderRadius: BorderRadius.circular(10),
          ),
          child: IconButton(
              onPressed: () async {
                setState(() {
                  _videoPlayerController = VideoPlayerController.network(
                      obtenerPublicacion.urlMultimedia)
                    ..initialize().then((_) {
                      setState(() {});
                    });
                });
              },
              icon: const Icon(Icons.play_arrow_rounded)));
    } else if (obtenerPublicacion.extencion == ".mp3" ||
        obtenerPublicacion.extencion == ".wav") {
      return Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10),
        ),
        child: InkWell(
          onTap: () async {
            await _audioPlayer
                .play(UrlSource(obtenerPublicacion.urlMultimedia));
          },
          child: Text(
            'Presiona para reproducir el audio',
            style: GoogleFonts.audiowide(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      );
    } else {
      return const Center();
    }
  }
}
