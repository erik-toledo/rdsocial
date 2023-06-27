import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rd_social/features/reaccion/domain/usecase/actualizar_reaccion_usecase.dart';
import 'package:rd_social/features/reaccion/domain/usecase/eliminar_reaccion_usecase.dart';
import 'package:rd_social/features/reaccion/presentation/bloc/ud_bloc/ud_reaccion_event.dart';
import 'package:rd_social/features/reaccion/presentation/bloc/ud_bloc/ud_reaccion_state.dart';

class UdReaccionBloc extends Bloc<UdReaccionEvent, UdReaccionState> {
  final ActualizarReaccionUsecase actualizarReaccionUsecase;
  final EliminarReaccionUsecase eliminarReaccionUsecase;

  UdReaccionBloc(
      {required this.actualizarReaccionUsecase,
      required this.eliminarReaccionUsecase})
      : super(UdReaccionInicial()) {
    on<UdReaccionEvent>((event, emit) async {
      if (event is PressActualizarReaccion) {
        try {
          emit(UdActualizandoReaccion());
          await actualizarReaccionUsecase.execute(event.reaccion);
          emit(UdReaccionActualizada());
        } catch (e) {
          emit(UdReaccionError(error: e.toString()));
        }
      } else if (event is PressEliminarReaccion) {
        try {
          emit(UdEliminarReaccion());
          await eliminarReaccionUsecase.execute(event.reaccion);
          emit(UdReaccionEliminar());
        } catch (e) {
          emit(UdReaccionEliminarError(error: e.toString()));
        }
      }
    });
  }
}
