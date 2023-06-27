import 'package:rd_social/features/reaccion/data/datasource/reaccion_remote_data_source.dart';
import 'package:rd_social/features/reaccion/domain/entities/reaccion.dart';
import 'package:rd_social/features/reaccion/domain/repositories/reaccion_repository.dart';

class ReaccionRepositoryImpl implements ReaccionRepository {
  ReaccionRemoteDataSource reaccionRemoteDataSource;
  ReaccionRepositoryImpl({required this.reaccionRemoteDataSource});
  @override
  Future<void> deleteReaccion(Reaccion reaccion) async {
    return await reaccionRemoteDataSource.deleteReaccion(reaccion);
  }

  @override
  Future<Reaccion> getReaccion(String idUsuario, String idPublicacion) async {
    return await reaccionRemoteDataSource.getReaccion(idUsuario, idPublicacion);
  }

  @override
  Future<bool> postReaccion(Reaccion reaccion) async {
    return await reaccionRemoteDataSource.postReaccion(reaccion);
  }

  @override
  Future<void> putReaccion(Reaccion reaccion) async {
    return await reaccionRemoteDataSource.putReaccion(reaccion);
  }
}
