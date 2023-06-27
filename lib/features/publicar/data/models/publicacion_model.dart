import 'package:rd_social/features/publicar/domain/entities/publicacion.dart';

class PublicacionModel extends Publicacion {
  PublicacionModel({
    required String descripcion,
    required String urlMultimedia,
    required String idUsuario,
    required String idPublicacion,
    required String extencion,
    required String hora,
  }) : super(
          descripcion: descripcion,
          urlMultimedia: urlMultimedia,
          idUsuario: idUsuario,
          idPublicacion: idPublicacion,
          hora: hora,
          extencion: extencion,
        );

  factory PublicacionModel.fromJson(Map<String, dynamic> data) {
    return PublicacionModel(
      descripcion: data['descripcion'],
      urlMultimedia: data['urlmultimedia'],
      extencion: data['extencion'],
      idUsuario: data['idusuario'],
      idPublicacion: data['idpublicacion'].toString(),
      hora: data['hora'],
    );
  }
  factory PublicacionModel.fromEntity(Publicacion publicacion) {
    return PublicacionModel(
      descripcion: publicacion.descripcion,
      urlMultimedia: publicacion.urlMultimedia,
      extencion: publicacion.extencion,
      idUsuario: publicacion.idUsuario,
      idPublicacion: publicacion.idPublicacion,
      hora: publicacion.hora,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idUsuario': idUsuario,
      'descripcion': descripcion,
      'urlMultimedia': urlMultimedia,
      'extencion': extencion,
      'hora': hora
    };
  }
}
