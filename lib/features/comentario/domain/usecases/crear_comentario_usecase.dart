import 'package:rd_social/features/comentario/domain/entities/comentario.dart';
import 'package:rd_social/features/comentario/domain/repositories/comentario_repository.dart';

class CrearComentarioUsecase {
  final ComentarioRepository comentarioRepository;

  CrearComentarioUsecase({required this.comentarioRepository});

  Future<void> execute(Comentario comentario) async {
    return await comentarioRepository.postComentario(comentario);
  }
}
