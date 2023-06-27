import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rd_social/features/comentario/domain/usecases/crear_comentario_usecase.dart';
import 'package:rd_social/features/comentario/domain/usecases/obtener_comentario_usuario_usecase.dart';

import '../../../domain/entities/comentario.dart';
import '../../../domain/entities/comentario_usuario.dart';

part 'cr_comentario_event.dart';
part 'cr_comentario_state.dart';

class CrComentarioBloc extends Bloc<CrComentarioEvent, CrComentarioState> {
  CrearComentarioUsecase comentarioUsecase;
  ObtenerComentarioUsuarioUsecase obtenerComentarioUsuarioUsecase;

  CrComentarioBloc(
      {required this.comentarioUsecase,
      required this.obtenerComentarioUsuarioUsecase})
      : super(CrComentarioInicial()) {
    on<CrComentarioEvent>((event, emit) async {
      if (event is PressCreateComentarioButton) {
        try {
          emit(CrSavingComentario());
          await comentarioUsecase.execute(event.comentario);
          emit(CrSavingComentario());
        } catch (e) {
          emit(CrErrorCreandoComentario(error: e.toString()));
        }
      } else if (event is PressObtenerComentarioButton) {
        try {
          emit(CrObteniendoComentarios());
          List<ComentarioUsuario> comentarios =
              await obtenerComentarioUsuarioUsecase.execute(
                  event.idUsuario, event.idPublicacion);
          emit(CrComentariosObtenidos(comentarios: comentarios));
        } catch (e) {
          emit(CrErrorObteniendoComentarios(error: e.toString()));
        }
      } else if (event is ReinicioEvent) {
        emit(CrComentarioInicial());
      }
    });
  }
}
