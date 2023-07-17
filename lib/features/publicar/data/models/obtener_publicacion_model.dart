import 'package:rd_social/features/publicar/domain/entities/obtener_publicacion.dart';

class ObtenerPublicacionModel extends ObtenerPublicacion {
  ObtenerPublicacionModel({
    required String descripcion,
    required String urlMultimedia,
    required String idUsuario,
    required String idPublicacion,
    required String extencion,
    required String hora,
    required String nombre,
    required String foto,
    required String latitud,
    required String longitud,
  }) : super(
          descripcion: descripcion,
          urlMultimedia: urlMultimedia,
          idUsuario: idUsuario,
          idPublicacion: idPublicacion,
          hora: hora,
          extencion: extencion,
          nombre: nombre,
          foto: foto,
          latitud: latitud,
          longitud: longitud,
        );

  factory ObtenerPublicacionModel.fromJson(Map<String, dynamic> data) {
    return ObtenerPublicacionModel(
      descripcion: data['descripcion'],
      urlMultimedia: data['urlmultimedia'],
      extencion: data['extencion'],
      idUsuario: data['idusuario'],
      idPublicacion: data['idpublicacion'].toString(),
      hora: data['hora'],
      nombre: data["nombre"],
      foto: data["foto"],
      latitud: data['latitud'],
      longitud: data['longitud'],
    );
  }
  factory ObtenerPublicacionModel.fromEntity(
      ObtenerPublicacion obtenerPublicacion) {
    return ObtenerPublicacionModel(
      descripcion: obtenerPublicacion.descripcion,
      urlMultimedia: obtenerPublicacion.urlMultimedia,
      extencion: obtenerPublicacion.extencion,
      idUsuario: obtenerPublicacion.idUsuario,
      idPublicacion: obtenerPublicacion.idPublicacion,
      hora: obtenerPublicacion.hora,
      nombre: obtenerPublicacion.nombre,
      foto: obtenerPublicacion.foto,
      latitud: obtenerPublicacion.latitud,
      longitud: obtenerPublicacion.longitud,
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
