import 'package:rd_social/features/comentario/data/datasource/comentario_remote_data_source.dart';
import 'package:rd_social/features/comentario/domain/entities/comentario_usuario.dart';
import 'package:rd_social/features/comentario/domain/repositories/cometario_usuario_repository.dart';

class ComentarioUsuarioRepositoryImpl implements ComentarioUsuarioRepository {
  final ComentarioRemoteDataSource comentarioRemoteDataSource;

  ComentarioUsuarioRepositoryImpl({required this.comentarioRemoteDataSource});
  @override
  Future<List<ComentarioUsuario>> getComentarios(
      String idUsuario, String idPublicacion) async {
    return await comentarioRemoteDataSource.getComentarios(
        idUsuario, idPublicacion);
  }
}
