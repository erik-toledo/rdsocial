part of 'rd_publicacion_bloc.dart';

@immutable
abstract class RdPublicacionState {}

class RdPublicacionInitial extends RdPublicacionState {}

class RdObteniendoPublicaciones extends RdPublicacionState {}

class RdPublicacionesObtenidas extends RdPublicacionState {
  final List<ObtenerPublicacion> publicacionesMuro;
  RdPublicacionesObtenidas({required this.publicacionesMuro});
}

class ErrorGetPublicacion extends RdPublicacionState {
  final String error;

  ErrorGetPublicacion({required this.error});
}

class DeletingPublicacion extends RdPublicacionState {}

class PublicacionDeleted extends RdPublicacionState {}

class ErrorDeletingPublicacion extends RdPublicacionState {
  final String error;
  ErrorDeletingPublicacion({required this.error});
}

class RdObteniendoPublicacionesAmigos extends RdPublicacionState {}

class RdPublicacionesObtenidasAmigos extends RdPublicacionState {
  final List<ObtenerPublicacion> publicaciones;
  RdPublicacionesObtenidasAmigos({required this.publicaciones});
}
