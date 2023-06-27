import 'dart:io';

import 'package:rd_social/features/publicar/domain/entities/obtener_publicacion.dart';
import 'package:rd_social/features/publicar/domain/entities/publicacion.dart';

abstract class PublicacionRepositori {
  Future<String> subirArchivoMultimedia(String path, File file);
  Future<String> crearPublicacion(Publicacion publicacion);
  Future<void> eliminarPublicacion(String id);
  Future<List<ObtenerPublicacion>> extraerPublicacion(String idUsuario);
  Future<void> editarPublicacion(String id, Publicacion publicacion);
  Future<List<ObtenerPublicacion>> extraerPublicacionAmigos();
}
