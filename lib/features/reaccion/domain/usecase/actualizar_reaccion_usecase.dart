import 'package:rd_social/features/reaccion/domain/entities/reaccion.dart';
import 'package:rd_social/features/reaccion/domain/repositories/reaccion_repository.dart';

class ActualizarReaccionUsecase {
  final ReaccionRepository reaccionRepository;

  ActualizarReaccionUsecase({required this.reaccionRepository});

  Future<void> execute(Reaccion reaccion) async {
    return await reaccionRepository.putReaccion(reaccion);
  }
}
