import 'package:rd_social/features/comentario/domain/entities/comentario.dart';
import 'package:rd_social/features/comentario/domain/repositories/comentario_repository.dart';

import '../datasource/comentario_remote_data_source.dart';

class ComentarioRepositoryImpl implements ComentarioRepository {
  final ComentarioRemoteDataSource comentarioRemoteDataSource;
  ComentarioRepositoryImpl({required this.comentarioRemoteDataSource});
  @override
  Future<void> postComentario(Comentario comentario) async {
    return await comentarioRemoteDataSource.postComentario(comentario);
  }

  @override
  Future<void> deleteComentario(String idUsuario, String idPublicacion,
      String idComentario, String idUsuarioComent) async {
    return await comentarioRemoteDataSource.deleteComentario(
        idUsuario, idPublicacion, idComentario, idUsuarioComent);
  }

  @override
  Future<void> putComentario(Comentario comentario) async {
    return await comentarioRemoteDataSource.putComentario(comentario);
  }
}
