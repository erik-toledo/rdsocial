// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rd_social/features/login/data/models/usuario_model.dart';
import 'package:rd_social/features/login/domain/entities/usuario.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../../../host.dart';

abstract class InicioSesionRemote {
  Future<bool> inicioSesion(String opcion);
  Future<bool> cerrarSesion();
}

class InicioSesionRemoteImpl implements InicioSesionRemote {
  @override
  Future<bool> inicioSesion(String opcion) async {
    var usuarioModel;
    var usuarioBody;
    var bodyRequest;

    //sharedPreferences para guardar los datos del usuario
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.clear();
    //EndPoint CrearUsuario
    var url = Uri.parse("${host()}/usuario");

    //Inicia FireBaseAuth
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleUser!.authentication;
      final AuthCredential authCredential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken);
      final UserCredential userCredential =
          await auth.signInWithCredential(authCredential);
      User? user = userCredential.user;
      if (user != null) {
        //Creacion del usuario
        Usuario usuario = Usuario(
            nombre: user.displayName!,
            email: user.email!,
            numero: (user.phoneNumber != null) ? user.phoneNumber! : "",
            foto: (user.photoURL != null) ? user.photoURL! : "",
            id: user.uid);
        List<UsuarioModel> usuarios = [UsuarioModel.fromEntity(usuario)];
        //Preparacion de los datos
        if (opcion == "R") {
          usuarioModel = UsuarioModel.fromEntity(usuario);
          usuarioBody = usuarioModel.toJson();
          bodyRequest = jsonEncode(usuarioBody);
          //Agregando a la bd
          try {
            await http.post(url, body: bodyRequest, headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            });
          } catch (e) {
            rethrow;
          }
        }
        //Mantener la informacion de manera local
        sharedPreferences.setString('usuario', jsonEncode(usuarios));
        return true;
      }
      return false;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> cerrarSesion() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      await googleSignIn.signOut();
      return true;
    } catch (e) {
      rethrow;
    }
  }
}
