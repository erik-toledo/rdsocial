import 'dart:io';
import 'dart:convert' as convert;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rd_social/features/publicar/data/models/obtener_publicacion_model.dart';
import 'package:rd_social/features/publicar/data/models/publicacion_model.dart';
import 'package:rd_social/features/publicar/domain/entities/obtener_publicacion.dart';
import 'package:rd_social/host.dart';

import '../../domain/entities/publicacion.dart';

abstract class PublicacionRemoteDataSource {
  Future<String> subirArchivoMultimedia(String path, File file);
  Future<String> crearPublicacion(Publicacion publicacion);
  Future<List<ObtenerPublicacion>> extraerPublicacionAmigos();
  Future<List<ObtenerPublicacion>> extraerPublicacion(String idUsuario);
  Future<void> eliminarPublicacion(String id);
  Future<void> editarPublicacion(String id, Publicacion publicacion);
}

class PublicacionRemoteDataSourceImpl implements PublicacionRemoteDataSource {
  @override
  Future<String> subirArchivoMultimedia(String path, File file) async {
    Reference reference = FirebaseStorage.instance.ref().child(path);
    UploadTask uploadTask = reference.putFile(file);
    TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() {});
    String url = await taskSnapshot.ref.getDownloadURL();
    return url;
  }

  @override
  Future<String> crearPublicacion(Publicacion publicacion) async {
    var publicacionModel = PublicacionModel.fromEntity(publicacion);
    var publicacionBody = publicacionModel.toJson();
    var body = convert.jsonEncode(publicacionBody);

    var url = Uri.parse("${host()}/publicacion");
    try {
      var idPublicacion =
          await http.post(url, body: body, headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      });
      final response = convert.jsonDecode(idPublicacion.body);
      return response['publicacion']['insertId'].toString();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> editarPublicacion(String id, Publicacion publicacion) {
    throw UnimplementedError();
  }

  @override
  Future<void> eliminarPublicacion(String id) {
    throw UnimplementedError();
  }

  @override
  Future<List<ObtenerPublicacion>> extraerPublicacionAmigos() async {
    var url = Uri.parse("${host()}/publicacion");

    var response = await http.get(url);
    if (response.statusCode == 200) {
      List<ObtenerPublicacionModel> publicaciones = convert
          .jsonDecode(response.body)
          .map<ObtenerPublicacionModel>(
              (data) => ObtenerPublicacionModel.fromJson(data))
          .toList();

      return publicaciones;
    } else {
      throw UnimplementedError();
    }
  }

  @override
  Future<List<ObtenerPublicacion>> extraerPublicacion(String idUsuario) async {
    var url = Uri.parse("${host()}/publicacion/muro/$idUsuario");
    debugPrint(url.toString());
    var response = await http.get(url);
    debugPrint(response.body);
    if (response.statusCode == 200) {
      List<ObtenerPublicacion> publicacionesMuro = convert
          .jsonDecode(response.body)
          .map<ObtenerPublicacionModel>(
              (data) => ObtenerPublicacionModel.fromJson(data))
          .toList();

      return publicacionesMuro;
    } else {
      throw UnimplementedError();
    }
  }
}
