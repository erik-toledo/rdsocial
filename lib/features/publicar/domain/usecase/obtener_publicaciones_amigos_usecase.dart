import 'package:rd_social/features/publicar/domain/entities/obtener_publicacion.dart';


import '../repositories/publicacion_repositori.dart';

class ObtenerPublicacionesAmigosUsecase {
  final PublicacionRepositori publicacionRepositori;
  ObtenerPublicacionesAmigosUsecase({required this.publicacionRepositori});

  Future<List<ObtenerPublicacion>> execute() async {
    return await publicacionRepositori.extraerPublicacionAmigos();
  }
}
