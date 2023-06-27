import 'package:rd_social/features/publicar/domain/entities/publicacion.dart';

import '../repositories/publicacion_repositori.dart';

abstract class EditarPublicacionUsecase {
  final PublicacionRepositori publicacionRepositori;

  EditarPublicacionUsecase({required this.publicacionRepositori});

  Future<void> execute(String id, Publicacion publicacion) async {
    return await publicacionRepositori.editarPublicacion(id, publicacion);
  }
}
