part of 'cr_comentario_bloc.dart';

@immutable
abstract class CrComentarioEvent {}

class PressCreateComentarioButton extends CrComentarioEvent {
  final Comentario comentario;

  PressCreateComentarioButton({required this.comentario});
}

class PressObtenerComentarioButton extends CrComentarioEvent {
  final String idUsuario;
  final String idPublicacion;
  PressObtenerComentarioButton(
      {required this.idUsuario, required this.idPublicacion});
}
class ReinicioEvent extends CrComentarioEvent{}
