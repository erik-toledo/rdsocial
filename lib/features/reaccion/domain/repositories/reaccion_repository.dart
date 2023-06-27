import 'package:rd_social/features/reaccion/domain/entities/reaccion.dart';

abstract class ReaccionRepository {
  Future<bool> postReaccion(Reaccion reaccion);
  Future<void> deleteReaccion(Reaccion reaccion);
  Future<void> putReaccion(Reaccion reaccion);
  Future<Reaccion> getReaccion(String idUsuario, String idPublicacion);
}
