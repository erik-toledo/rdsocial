import 'package:rd_social/features/publicar/domain/entities/obtener_publicacion.dart';

import '../repositories/publicacion_repositori.dart';

class ObtenerPublicacionUsecase {
  final PublicacionRepositori publicacionRepositori;
  ObtenerPublicacionUsecase({required this.publicacionRepositori});

  Future<List<ObtenerPublicacion>> execute(String idUsuario) async {
    return await publicacionRepositori.extraerPublicacion(idUsuario);
  }
}
