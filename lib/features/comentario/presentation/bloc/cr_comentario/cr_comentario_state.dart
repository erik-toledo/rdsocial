part of 'cr_comentario_bloc.dart';

@immutable
abstract class CrComentarioState {}

class CrComentarioInicial extends CrComentarioState {}

class CrSavingComentario extends CrComentarioState {}

class CrComentarioSaved extends CrComentarioState {}

class CrErrorCreandoComentario extends CrComentarioState {
  final String error;

  CrErrorCreandoComentario({required this.error});
}

class CrObteniendoComentarios extends CrComentarioState {}

class CrComentariosObtenidos extends CrComentarioState {
  final List<ComentarioUsuario> comentarios;
  CrComentariosObtenidos({required this.comentarios});
}

class CrErrorObteniendoComentarios extends CrComentarioState {
  final String error;

  CrErrorObteniendoComentarios({required this.error});
}
