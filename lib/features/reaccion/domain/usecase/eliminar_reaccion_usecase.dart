import 'package:rd_social/features/reaccion/domain/entities/reaccion.dart';
import 'package:rd_social/features/reaccion/domain/repositories/reaccion_repository.dart';

class EliminarReaccionUsecase {
  final ReaccionRepository reaccionRepository;

  EliminarReaccionUsecase({required this.reaccionRepository});

  Future<void> execute(Reaccion reaccion) async {
    return await reaccionRepository.deleteReaccion(reaccion);
  }
}
