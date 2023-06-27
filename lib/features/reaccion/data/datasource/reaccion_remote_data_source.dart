import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rd_social/features/reaccion/data/model/reaccion_model.dart';

import '../../../../host.dart';
import '../../domain/entities/reaccion.dart';
import 'package:http/http.dart' as http;

abstract class ReaccionRemoteDataSource {
  Future<bool> postReaccion(Reaccion reaccion);
  Future<void> deleteReaccion(Reaccion reaccion);
  Future<void> putReaccion(Reaccion reaccion);
  Future<Reaccion> getReaccion(String idUsuario, String idPublicacion);
}

class ReaccionRemoteDataSourceImpl implements ReaccionRemoteDataSource {
  @override
  Future<void> deleteReaccion(Reaccion reaccion) async {
    var reaccionModel = ReaccionModel.fromEntity(reaccion);
    var reaccionBody = reaccionModel.toJson();
    var body = jsonEncode(reaccionBody);
    var url = Uri.parse('${host()}/reaccion');
    try {
      await http.delete(url, body: body, headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Reaccion> getReaccion(String idUsuario, String idPublicacion) async {
    var url = Uri.parse("${host()}/reaccion/$idPublicacion/$idUsuario");
    var response = await http.get(url);
    try {
      if (response.statusCode == 200) {
        debugPrint(response.body);
        List<ReaccionModel> reaccion = jsonDecode(response.body)
            .map<ReaccionModel>((data) => ReaccionModel.fromJson(data))
            .toList();
        return reaccion[0];
      }
    } catch (e) {
      rethrow;
    }
    return throw UnimplementedError();
  }

  @override
  Future<bool> postReaccion(Reaccion reaccion) async {
    var reaccionModel = ReaccionModel.fromEntity(reaccion);
    var reaccionBody = reaccionModel.toJson();
    var body = jsonEncode(reaccionBody);
    var url = Uri.parse('${host()}/reaccion');
    try {
      await http.post(url, body: body, headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      });
      return true;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> putReaccion(Reaccion reaccion) async {
    var reaccionModel = ReaccionModel.fromEntity(reaccion);
    var reaccionBody = reaccionModel.toJson();
    var body = jsonEncode(reaccionBody);
    var url = Uri.parse('${host()}/reaccion');
    try {
      await http.put(url, body: body, headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      });
    } catch (e) {
      rethrow;
    }
  }
}
