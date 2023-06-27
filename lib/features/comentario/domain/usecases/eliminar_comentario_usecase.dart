import 'package:rd_social/features/comentario/domain/repositories/comentario_repository.dart';

class EliminarComentarioUsecase {
  final ComentarioRepository comentarioRepository;
  EliminarComentarioUsecase({required this.comentarioRepository});

  Future<void> execute(String idUsuario, String idPublicacion,
      String idComentario, String idUsuarioComent) async {
    return await comentarioRepository.deleteComentario(
        idUsuario, idPublicacion, idComentario, idUsuarioComent);
  }
}
