import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rd_social/features/reaccion/domain/usecase/crear_reaccion_usecase.dart';
import 'package:rd_social/features/reaccion/domain/usecase/obtener_reaccion_usecase.dart';

import '../../../domain/entities/reaccion.dart';
part 'reaccion_event.dart';
part 'reaccion_state.dart';

class ReaccionBloc extends Bloc<ReaccionEvent, ReaccionState> {
  final ObtenerReaccionUsecase obtenerReaccionUsecase;
  final CrearReaccionUsecase crearReaccionUsecase;

  Future<bool> crearReaccion(Reaccion reaccion) async {
    try {
      await crearReaccionUsecase.execute(reaccion);
      return true;
    } catch (e) {
      rethrow;
    }
  }

  ReaccionBloc(
      {required this.crearReaccionUsecase,
      required this.obtenerReaccionUsecase})
      : super(ReaccionEventInicial()) {
    on<ReaccionEvent>(
      (event, emit) async {
        if (event is PressObtenerReacionesEvent) {
          try {
            emit(ReaccionObteniendoReaccion());
            Reaccion reaccion = await obtenerReaccionUsecase.execute(
                event.idUsuario, event.idPublicacion);
            emit(ReaccionObtenida(reaccion: reaccion));
          } catch (e) {
            debugPrint(e.toString());
            emit(ReaccionError(error: e.toString()));
          }
        }
      },
    );
  }
}
