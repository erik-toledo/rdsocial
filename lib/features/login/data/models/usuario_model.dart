import 'package:rd_social/features/login/domain/entities/usuario.dart';

class UsuarioModel extends Usuario {
  UsuarioModel({
    required String nombre,
    required String email,
    required String numero,
    required String foto,
    required String id,
  }) : super(nombre: nombre, email: email, numero: numero, foto: foto, id: id);

  factory UsuarioModel.fromEntity(Usuario usuario) {
    return UsuarioModel(
        nombre: usuario.nombre,
        email: usuario.email,
        numero: usuario.numero,
        foto: usuario.foto,
        id: usuario.id);
  }
  factory UsuarioModel.fromJson(Map<String, dynamic> data) {
    return UsuarioModel(
        id: data['idUsuario'],
        email: data['email'],
        numero: data['numero'],
        nombre: data['nombre'],
        foto: data['foto']);
  }

  Map<String, dynamic> toJson() {
    return {
      'idUsuario': id,
      'email': email,
      'numero': numero,
      'nombre': nombre,
      'foto': foto,
    };
  }
}
