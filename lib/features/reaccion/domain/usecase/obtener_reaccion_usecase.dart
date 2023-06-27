import '../entities/reaccion.dart';
import '../repositories/reaccion_repository.dart';

class ObtenerReaccionUsecase {
  final ReaccionRepository reaccionRepository;
  ObtenerReaccionUsecase({required this.reaccionRepository});

  Future<Reaccion> execute(String idUsuario, String idPublicacion) async {
    return await reaccionRepository.getReaccion(idUsuario, idPublicacion);
  }
}
