import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/comentario_usuario.dart';
import '../../../domain/usecases/obtener_comentario_usuario_usecase.dart';
part 'ud_comentario_event.dart';
part 'ud_comentario_state.dart';

class UdComentarioBloc extends Bloc<UdComentarioEvent, UdComentarioState> {
  ObtenerComentarioUsuarioUsecase obtenerComentarioUsuarioUsecase;
  UdComentarioBloc({required this.obtenerComentarioUsuarioUsecase})
      : super(UdComentarioInicial()) {
    on<UdComentarioEvent>((event, emit) async {});
  }
}
