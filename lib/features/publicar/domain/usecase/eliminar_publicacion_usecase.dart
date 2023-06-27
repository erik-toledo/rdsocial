import '../repositories/publicacion_repositori.dart';

class EliminarPublicacionUsecase {
  final PublicacionRepositori publicacionRepositori;
  EliminarPublicacionUsecase({required this.publicacionRepositori});

  Future<void> execute(String id) async {
    return await publicacionRepositori.eliminarPublicacion(id);
  }
}
