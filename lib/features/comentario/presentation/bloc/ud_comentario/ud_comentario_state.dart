part of 'ud_comentario_bloc.dart';

@immutable
abstract class UdComentarioState {}

class UdComentarioInicial extends UdComentarioState {}

class UdObteniendoComentarios extends UdComentarioState {}

class UdComentariosObtenidos extends UdComentarioState {
  final List<ComentarioUsuario> comentarios;
  UdComentariosObtenidos({required this.comentarios});
}

class UdErrorObteniendoComentarios extends UdComentarioState {
  final String error;

  UdErrorObteniendoComentarios({required this.error});
}
