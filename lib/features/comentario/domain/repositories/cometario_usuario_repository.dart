import 'package:rd_social/features/comentario/domain/entities/comentario_usuario.dart';

abstract class ComentarioUsuarioRepository {
  Future<List<ComentarioUsuario>> getComentarios(String idUsuario, String idPublicacion);
}
