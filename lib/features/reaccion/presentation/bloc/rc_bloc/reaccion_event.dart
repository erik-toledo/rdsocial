part of 'reaccion_bloc.dart';

@immutable
abstract class ReaccionEvent {}

class PressObtenerReacionesEvent extends ReaccionEvent {
  final String idUsuario;
  final String idPublicacion;
  PressObtenerReacionesEvent({
    required this.idUsuario,
    required this.idPublicacion,
  });
}
