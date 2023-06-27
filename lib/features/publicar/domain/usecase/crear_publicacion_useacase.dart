import 'package:rd_social/features/publicar/domain/entities/publicacion.dart';

import '../repositories/publicacion_repositori.dart';

class CrearPublicacionUsecase {
  final PublicacionRepositori publicacionRepositori;

  CrearPublicacionUsecase({required this.publicacionRepositori});

  Future<String> execute(Publicacion publicacion) async {
    return await publicacionRepositori.crearPublicacion(publicacion);
  }
}
