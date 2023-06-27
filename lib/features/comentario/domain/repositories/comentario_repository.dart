import 'package:rd_social/features/comentario/domain/entities/comentario.dart';

abstract class ComentarioRepository {
  Future<void> postComentario(Comentario comentario);
  Future<void> deleteComentario(String idUsuario, String idPublicacion,
      String idComentario, String idUsuarioComent);
  Future<void> putComentario(Comentario comentario);
}
