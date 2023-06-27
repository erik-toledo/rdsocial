import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rd_social/features/comentario/data/models/comentario_model.dart';
import 'package:rd_social/features/comentario/data/models/comentario_usuario_model.dart';

import '../../../../host.dart';
import '../../domain/entities/comentario.dart';
import '../../domain/entities/comentario_usuario.dart';
import 'package:http/http.dart' as http;

abstract class ComentarioRemoteDataSource {
  Future<void> postComentario(Comentario comentario);
  Future<void> deleteComentario(String idUsuario, String idPublicacion,
      String idComentario, String idUsuarioComent);
  Future<void> putComentario(Comentario comentario);
  Future<List<ComentarioUsuario>> getComentarios(
      String idUsuario, String idPublicacion);
}

class ComentarioRemoteDataSourceImpl implements ComentarioRemoteDataSource {
  @override
  Future<void> deleteComentario(String idUsuario, String idPublicacion,
      String idComentario, String idUsuarioComent) {
    throw UnimplementedError();
  }

  @override
  Future<List<ComentarioUsuario>> getComentarios(
      String idUsuario, String idPublicacion) async {
    var url = Uri.parse(
        "${host()}/comentario/$idUsuario/$idPublicacion");
    var response = await http.get(url);
    debugPrint(response.body);
    if (response.statusCode == 200) {
      List<ComentarioUsuarioModel> comentarios = jsonDecode(response.body)
          .map<ComentarioUsuarioModel>(
              (data) => ComentarioUsuarioModel.fromJson(data))
          .toList();
      return comentarios;
    } else {
      throw UnimplementedError();
    }
  }

  @override
  Future<void> postComentario(Comentario comentario) async {
    var comentarioModel = ComentarioModel.fromEntity(comentario);
    var comentarioBody = comentarioModel.toJson();
    var body = jsonEncode(comentarioBody);

    var url = Uri.parse("${host()}/comentario");
    try {
      await http.post(url, body: body, headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> putComentario(Comentario comentario) {
    throw UnimplementedError();
  }
}
