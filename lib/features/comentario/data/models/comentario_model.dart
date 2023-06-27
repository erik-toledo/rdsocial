import 'package:rd_social/features/comentario/domain/entities/comentario.dart';

class ComentarioModel extends Comentario {
  ComentarioModel({
    required String comentario,
    required String idUsuario,
    required String idPublicacion,
    required String idUsuarioComentario,
  }) : super(
          comentario: comentario,
          idPublicacion: idPublicacion,
          idUsuario: idUsuario,
          idUsuarioComentario: idUsuarioComentario,
        );

  factory ComentarioModel.fromEntity(Comentario comentarioObj) {
    return ComentarioModel(
        comentario: comentarioObj.comentario,
        idUsuario: comentarioObj.idUsuario,
        idPublicacion: comentarioObj.idPublicacion,
        idUsuarioComentario: comentarioObj.idUsuarioComentario);
  }

  factory ComentarioModel.fromJson(Map<String, dynamic> json) {
    return ComentarioModel(
        comentario: json['comentario'],
        idUsuario: json['idUsuario'],
        idPublicacion: json['idPublicacion'],
        idUsuarioComentario: json['idUsuarioComentario']);
  }

  Map<String, dynamic> toJson() {
    return {
      'comentario': comentario,
      'idUsuario': idUsuario,
      'idPublicacion': idPublicacion,
      'idUsuarioComent': idUsuarioComentario
    };
  }
}
