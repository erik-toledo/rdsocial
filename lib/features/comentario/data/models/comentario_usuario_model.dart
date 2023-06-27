import 'package:rd_social/features/comentario/domain/entities/comentario_usuario.dart';

class ComentarioUsuarioModel extends ComentarioUsuario {
  ComentarioUsuarioModel({
    required String idUsuario,
    required String idPublicacion,
    required String idComentario,
    required String idUsuarioComent,
    required String foto,
    required String nombre,
    required String comentario,
  }) : super(
            idUsuario: idUsuario,
            idPublicacion: idPublicacion,
            idComentario: idComentario,
            idUsuarioComent: idUsuarioComent,
            foto: foto,
            nombre: nombre,
            comentario: comentario);

  factory ComentarioUsuarioModel.fromEntity(
      ComentarioUsuario comentarioUsuario) {
    return ComentarioUsuarioModel(
        idUsuario: comentarioUsuario.idUsuario,
        idPublicacion: comentarioUsuario.idPublicacion,
        idComentario: comentarioUsuario.idComentario,
        idUsuarioComent: comentarioUsuario.idUsuarioComent,
        foto: comentarioUsuario.foto,
        nombre: comentarioUsuario.nombre,
        comentario: comentarioUsuario.comentario);
  }

  factory ComentarioUsuarioModel.fromJson(Map<String, dynamic> json) {
    return ComentarioUsuarioModel(
        idUsuario: json["idusuario"],
        idPublicacion: json["idpublicacion"].toString(),
        idComentario: json["idcomentario"].toString(),
        idUsuarioComent: json["idusuariocoment"],
        foto: json["foto"],
        nombre: json["nombre"],
        comentario: json["comentario"]);
  }
}
