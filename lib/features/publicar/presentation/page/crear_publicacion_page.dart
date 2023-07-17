// ignore_for_file: deprecated_member_use, avoid_single_cascade_in_expression_statements, use_build_context_synchronously

import 'dart:io';
// ignore: depend_on_referenced_packages
import 'package:location/location.dart';
import 'package:path/path.dart' as p;
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rd_social/features/login/domain/entities/usuario.dart';
import 'package:rd_social/features/login/presentation/bloc/inicio_sesion/inicio_sesion_bloc.dart';
import 'package:rd_social/features/publicar/domain/entities/publicacion.dart';
import 'package:rd_social/features/publicar/presentation/bloc/cu_publicacion/cu_publicacion_bloc.dart';
import 'package:rd_social/features/publicar/presentation/bloc/rd_publicacion/rd_publicacion_bloc.dart';
import 'package:rd_social/features/publicar/presentation/page/muro_amigos_page.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:video_player/video_player.dart';
import 'package:file_picker/file_picker.dart';

import '../../../reaccion/domain/entities/reaccion.dart';
import '../../../reaccion/presentation/bloc/rc_bloc/reaccion_bloc.dart';

class CrearPublicaconPage extends StatefulWidget {
  const CrearPublicaconPage({super.key});

  @override
  State<CrearPublicaconPage> createState() => _CrearPublicaconPageState();
}

class _CrearPublicaconPageState extends State<CrearPublicaconPage> {
  String? _image;
  String? _audio;
  String? _gif;
  String? extension;
  Publicacion? publicacion;
  int index = 0;
  bool noShadow = false;
  final descripcionController = TextEditingController();
  LocationData? currentLocation;

  final ImagePicker _imagePicker = ImagePicker();
  final AudioPlayer _audioPlayer = AudioPlayer();
  VideoPlayerController? _videoPlayerController;
  String id = "";
  bool echo = true;
  String? pdf;
  String? message;
  @override
  void dispose() {
    _videoPlayerController?.dispose();
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  void initState() {
    extraerDatos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(240, 240, 240, 1),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                width: double.infinity,
                height: 50,
                child: Container(
                  width: 90,
                  padding: const EdgeInsets.only(right: 22),
                  child: IconButton(
                      onPressed: () {
                        context.read<CuPublicacionBloc>().add(ReinicioEvent());
                        Navigator.pop(context);
                      },
                      icon: SvgPicture.asset(
                        'assets/images_icons/back.svg',
                        width: 70,
                      )),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 15),
                width: double.infinity,
                height: 140,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Crear',
                          style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 50),
                          child: Container(
                            width: 150,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: (noShadow)
                                    ? const <BoxShadow>[
                                        BoxShadow(
                                          offset: Offset(0, 4),
                                          blurRadius: 40,
                                          color: Color.fromRGBO(0, 0, 0, 0.304),
                                        )
                                      ]
                                    : null),
                            child: BlocBuilder<CuPublicacionBloc,
                                CuPublicacionState>(
                              builder: (context, state) {
                                if (state is FileSaved) {
                                  return ElevatedButton(
                                    onPressed: () async {
                                      await crearPublicacion(state.ruta);
                                      if (echo) {
                                        Route route = MaterialPageRoute(
                                            builder: (context) =>
                                                const MuroAmigosPage());
                                        Navigator.pop(context, route);
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                        elevation: 0,
                                        backgroundColor: Colors.blue,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                    child: Text(
                                      'Publicar',
                                      style: GoogleFonts.montserrat(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  );
                                } else if (state is SavingFile) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } else if (currentLocation != null) {
                                  return ElevatedButton(
                                    onPressed: () async {
                                      await crearPublicacion("");
                                      if (echo) {
                                        Route route = MaterialPageRoute(
                                            builder: (context) =>
                                                const MuroAmigosPage());
                                        Navigator.pop(context, route);
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                        elevation: 0,
                                        backgroundColor: Colors.blue,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                    child: Text(
                                      'Publicar',
                                      style: GoogleFonts.montserrat(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  );
                                } else {
                                  return ElevatedButton(
                                    onPressed: null,
                                    style: ElevatedButton.styleFrom(
                                        elevation: 0,
                                        backgroundColor: Colors.green,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                    child: Text(
                                      'Publicar',
                                      style: GoogleFonts.montserrat(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  );
                                }
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Publicación ',
                          style: GoogleFonts.montserrat(
                              textStyle: const TextStyle(
                                  fontSize: 35, fontWeight: FontWeight.w600)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 360,
                height: 60,
                child: Row(
                  children: [
                    SizedBox(
                      width: 360,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 60,
                            child: IconButton(
                                onPressed: () {
                                  getGif();
                                },
                                icon: SvgPicture.asset(
                                  'assets/images_icons_publicacion/gif.svg',
                                  alignment: Alignment.topCenter,
                                  color: Colors.blue,
                                  width: 30,
                                )),
                          ),
                          SizedBox(
                            width: 60,
                            child: IconButton(
                              onPressed: () {
                                getAudio();
                              },
                              icon: SvgPicture.asset(
                                'assets/images_icons_publicacion/audio.svg',
                                width: 25,
                                color: Colors.blue,
                                alignment: Alignment.topCenter,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 60,
                            child: IconButton(
                              onPressed: () {
                                getImage();
                              },
                              icon: SvgPicture.asset(
                                'assets/images_icons_publicacion/image.svg',
                                width: 40,
                                color: Colors.blue,
                                alignment: Alignment.topCenter,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 60,
                            child: IconButton(
                              onPressed: () {
                                getVideo();
                              },
                              icon: SvgPicture.asset(
                                'assets/images_icons_publicacion/video.svg',
                                width: 30,
                                color: Colors.blue,
                                alignment: Alignment.topCenter,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 60,
                            child: IconButton(
                                onPressed: () {
                                  getPdf();
                                },
                                icon: SvgPicture.asset(
                                  'assets/images_icons_publicacion/pdf.svg',
                                  alignment: Alignment.topCenter,
                                  color: Colors.blue,
                                  width: 30,
                                )),
                          ),
                          SizedBox(
                            width: 60,
                            child: IconButton(
                                onPressed: () {
                                  getUbicacion();
                                },
                                icon: SvgPicture.asset(
                                  'assets/images_icons_publicacion/ubicacion.svg',
                                  alignment: Alignment.topCenter,
                                  color: Colors.blue,
                                  width: 30,
                                )),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 30,
                child: Row(
                  children: [
                    Container(
                      alignment: Alignment.bottomCenter,
                      margin: const EdgeInsets.only(left: 15, bottom: 5),
                      width: 220,
                      child: Text(
                        'Añade una descripción',
                        style: GoogleFonts.montserrat(
                          textStyle: const TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w600),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 345,
                height: 90,
                child: TextField(
                  controller: descripcionController,
                  decoration: InputDecoration(
                    hintText: 'Escribe una descripción',
                    hintStyle: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                        color: Color.fromRGBO(211, 211, 211, 1),
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    filled: true,
                    fillColor: const Color.fromRGBO(229, 229, 229, 1),
                    enabledBorder: const OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromRGBO(240, 240, 240, 1)),
                    ),
                  ),
                  keyboardType: TextInputType.text,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 30, bottom: 10),
                width: 335,
                height: 300,
                child: (_image != null)
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.file(
                          File(_image!),
                          fit: BoxFit.cover,
                        ),
                      )
                    : (_audio != null)
                        ? Container(
                            width: 335,
                            height: 290,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10)),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                onPressed: () async {
                                  await _audioPlayer
                                      .play(DeviceFileSource(_audio!));
                                },
                                child: const Text('Reproducir audio')),
                          )
                        : (_gif != null)
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.file(
                                  File(_gif!),
                                  fit: BoxFit.cover,
                                ),
                              )
                            : (_videoPlayerController != null)
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: VideoPlayer(_videoPlayerController!),
                                  )
                                : (pdf != null)
                                    ? SfPdfViewer.file(File(pdf!))
                                    : (currentLocation != null)
                                        ? Center(
                                            child: Text(
                                              "Tu ubicación es: \n${currentLocation!.latitude} ${currentLocation!.altitude}",
                                              textAlign: TextAlign.center,
                                            ),
                                          )
                                        : Center(
                                            child: Text(
                                              'No se ha seleccionado ningun archivo multimedia',
                                              style: GoogleFonts.montserrat(
                                                textStyle: const TextStyle(
                                                  fontSize: 12,
                                                  fontStyle: FontStyle.italic,
                                                ),
                                              ),
                                            ),
                                          ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: _videoPlayerController != null &&
              _videoPlayerController!.value.isInitialized
          ? FloatingActionButton(
              onPressed: () {
                setState(() {
                  _videoPlayerController!.value.isPlaying
                      ? _videoPlayerController!.pause()
                      : _videoPlayerController!.play();
                });
              },
              child: (_videoPlayerController!.value.isPlaying)
                  ? const Icon(Icons.pause_circle_outline)
                  : const Icon(Icons.play_arrow),
            )
          : null,
    );
  }

  void getImage() async {
    XFile? xFile = await _imagePicker.pickImage(source: ImageSource.gallery);

    if (xFile != null) {
      String ruta = 'images/${xFile.name}';
      context
          .read<CuPublicacionBloc>()
          .add(PressUploadFileButton(path: ruta, file: File(xFile.path)));
      setState(() {
        _image = xFile.path;
        extension = p.extension(ruta);
        noShadow = !noShadow;
      });
    } else {
      debugPrint('No se seleccionó ninguna imagen.');
    }
  }

  void getAudio() async {
    FilePickerResult? filePickerResult = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['mp3', 'wav'], // Extensiones permitidas
    );

    if (filePickerResult != null) {
      String ruta = 'audio/${filePickerResult.files.single.name}';
      context.read<CuPublicacionBloc>().add(PressUploadFileButton(
          path: ruta, file: File(filePickerResult.files.single.path!)));
      setState(() {
        _audio = filePickerResult.files.single.path!;
        extension = p.extension(ruta);
        noShadow = !noShadow;
      });
    } else {
      debugPrint('No se seleccionó ningún audio.');
    }
  }

  void getVideo() async {
    XFile? xFile = await _imagePicker.pickVideo(source: ImageSource.gallery);
    if (xFile != null) {
      String ruta = 'videos/${xFile.name}';

      context
          .read<CuPublicacionBloc>()
          .add(PressUploadFileButton(path: ruta, file: File(xFile.path)));
      _videoPlayerController = VideoPlayerController.file(File(xFile.path))
        ..initialize().then((_) {
          setState(() {});
        });
      setState(() {
        extension = p.extension(ruta);
        noShadow = !noShadow;
      });
    } else {
      debugPrint('No se seleccionó ningún video.');
    }
  }

  void getGif() async {
    XFile? xFile = await _imagePicker.pickImage(source: ImageSource.gallery);

    if (xFile != null) {
      String ruta = 'gif/${xFile.name}';
      context
          .read<CuPublicacionBloc>()
          .add(PressUploadFileButton(path: ruta, file: File(xFile.path)));
      setState(() {
        _gif = xFile.path;
        extension = p.extension(ruta);
        noShadow = !noShadow;
      });
    } else {
      debugPrint('No se seleccionó ningún GIF.');
    }
  }

  void getPdf() async {
    FilePickerResult? filePickerResult = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (filePickerResult != null) {
      String ruta = 'pdfs/${filePickerResult.files.single.name}';
      context.read<CuPublicacionBloc>().add(PressUploadFileButton(
          path: ruta, file: File(filePickerResult.files.single.path!)));
      setState(() {
        pdf = filePickerResult.files.single.path;
        message = null;
        extension = p.extension(ruta);
        noShadow = !noShadow;
      });
    } else {
      setState(() {
        pdf = filePickerResult!.files.single.path;
        message = 'No se seleccionó ningún PDF';
      });
    }
  }

  void getUbicacion() async {
    Location location = Location();

    location.getLocation().then((location) {
      setState(() {
        currentLocation = location;
        extension = ".map";
      });
    });
  }

  extraerDatos() async {
    List<Usuario> user =
        await context.read<InicioSesionBloc>().obtnerDatosUsuarioLocal();
    setState(() {
      id = user[0].id.toString();
    });
  }

  crearPublicacion(String ruta) async {
    bool respons = false;
    TimeOfDay hora = TimeOfDay.now();
    if (currentLocation != null) {
      publicacion = Publicacion(
        descripcion: descripcionController.text,
        extencion: extension!,
        hora: "${hora.hour}:${hora.minute}",
        idPublicacion: "",
        idUsuario: id,
        urlMultimedia: ruta,
        latitud: currentLocation!.latitude!.toString(),
        longitud: currentLocation!.longitude!.toString(),
      );
      String response =
          await context.read<CuPublicacionBloc>().publicar(publicacion!);
      if (response.isNotEmpty) {
        Reaccion reaccion = Reaccion(
            idPublicacion: response,
            idUsuario: id,
            cantidadReacciones: "0",
            idReaccion: "");
        respons = await context.read<ReaccionBloc>().crearReaccion(reaccion);
        if (respons) {
          context.read<CuPublicacionBloc>().add(ReinicioEvent());
          context.read<RdPublicacionBloc>().add(ObtenerPublicaciones());
        }
      }
      setState(() {
        echo = (respons) ? true : false;
      });
    }
  }
}
