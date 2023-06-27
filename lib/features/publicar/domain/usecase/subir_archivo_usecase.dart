import 'dart:io';

import 'package:rd_social/features/publicar/domain/repositories/publicacion_repositori.dart';

class SubirArchivoUsecase {
  final PublicacionRepositori publicacionRepositori;

  SubirArchivoUsecase({required this.publicacionRepositori});

  Future<String> execute(String path, File file) async {
    return await publicacionRepositori.subirArchivoMultimedia(path, file);
  }
}
