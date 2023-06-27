part of 'rd_publicacion_bloc.dart';

@immutable
abstract class RdPublicacionEvent {}

class GetPublicacion extends RdPublicacionEvent {
  final String idUsuario;

  GetPublicacion({required this.idUsuario});
}

class PressDeletePublicacion extends RdPublicacionEvent {
  final String id;
  PressDeletePublicacion({required this.id});
}

class ObtenerPublicaciones extends RdPublicacionEvent {}

class PressReinicioEvent extends RdPublicacionEvent {}
