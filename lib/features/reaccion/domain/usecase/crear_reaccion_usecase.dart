import 'package:rd_social/features/reaccion/domain/entities/reaccion.dart';
import 'package:rd_social/features/reaccion/domain/repositories/reaccion_repository.dart';

class CrearReaccionUsecase {
  final ReaccionRepository reaccionRepository;

  CrearReaccionUsecase({required this.reaccionRepository});

  Future<bool> execute(Reaccion reaccion) async {
    return await reaccionRepository.postReaccion(reaccion);
  }
}
