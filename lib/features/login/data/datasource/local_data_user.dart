import 'dart:convert';

import 'package:rd_social/features/login/data/models/usuario_model.dart';
import 'package:rd_social/features/login/domain/entities/usuario.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalDataUser {
  Future<List<Usuario>> informacionUsuario();
}

class LocalDataUserImpl implements LocalDataUser {
  @override
  Future<List<Usuario>> informacionUsuario() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var usersString = sharedPreferences.getString('usuario') ?? "[]";
    List<UsuarioModel> user = jsonDecode(usersString)
        .map<UsuarioModel>((data) => UsuarioModel.fromJson(data))
        .toList();
    return user;
  }
}
