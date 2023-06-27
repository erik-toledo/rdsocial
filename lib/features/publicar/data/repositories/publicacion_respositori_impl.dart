import 'dart:io';

import 'package:rd_social/features/publicar/data/datasource/publicacion_remote_data_source.dart';
import 'package:rd_social/features/publicar/domain/entities/obtener_publicacion.dart';
import 'package:rd_social/features/publicar/domain/entities/publicacion.dart';
import 'package:rd_social/features/publicar/domain/repositories/publicacion_repositori.dart';

class PublicacionRepositoryImpl implements PublicacionRepositori {
  final PublicacionRemoteDataSource publicacionRemoteDataSource;

  PublicacionRepositoryImpl({required this.publicacionRemoteDataSource});

  @override
  Future<String> subirArchivoMultimedia(String path, File file) async {
    return await publicacionRemoteDataSource.subirArchivoMultimedia(path, file);
  }

  @override
  Future<String> crearPublicacion(Publicacion publicacion) async {
    return await publicacionRemoteDataSource.crearPublicacion(publicacion);
  }

  @override
  Future<void> editarPublicacion(String id, Publicacion publicacion) async {
    return await publicacionRemoteDataSource.editarPublicacion(id, publicacion);
  }

  @override
  Future<void> eliminarPublicacion(String id) async {
    return await publicacionRemoteDataSource.eliminarPublicacion(id);
  }

  @override
  Future<List<ObtenerPublicacion>> extraerPublicacion(String idUsuario) async {
    return await publicacionRemoteDataSource.extraerPublicacion(idUsuario);
  }

  @override
  Future<List<ObtenerPublicacion>> extraerPublicacionAmigos() async {
    return await publicacionRemoteDataSource.extraerPublicacionAmigos();
  }
}
