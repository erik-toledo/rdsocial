import 'package:rd_social/features/comentario/domain/entities/comentario_usuario.dart';
import 'package:rd_social/features/comentario/domain/repositories/cometario_usuario_repository.dart';

class ObtenerComentarioUsuarioUsecase {
  final ComentarioUsuarioRepository comentarioUsuarioRepository;

  ObtenerComentarioUsuarioUsecase({required this.comentarioUsuarioRepository});

  Future<List<ComentarioUsuario>> execute(
      String idUsuario, String idPublicacion) async {
    return await comentarioUsuarioRepository.getComentarios(idUsuario,idPublicacion);
  }
}
