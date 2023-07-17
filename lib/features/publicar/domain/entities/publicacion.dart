class Publicacion {
  final String descripcion;
  final String urlMultimedia;
  final String idUsuario;
  final String idPublicacion;
  final String extencion;
  final String hora;
  final String latitud;
  final String longitud;

  Publicacion({
    required this.descripcion,
    required this.urlMultimedia,
    required this.extencion,
    required this.idUsuario,
    required this.idPublicacion,
    required this.hora,
    required this.latitud,
    required this.longitud,
  });
}
