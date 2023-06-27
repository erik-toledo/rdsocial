import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rd_social/features/login/presentation/bloc/cerrar_sesion/cerrar_sesion_event.dart';
import 'package:rd_social/features/login/presentation/bloc/cerrar_sesion/cerrar_sesion_state.dart';

import '../../../domain/usecase/cerrar_sesion_usecase.dart';

class CerrarSesionBloc extends Bloc<CerrarSesionEvent, CerrarSesionState> {
  final CerrarSesionUsecase cerrarSesionUsecase;

  Future<bool> cerrarSesion() async {
    try {
      bool response = await cerrarSesionUsecase.execute();
      if (response) return response;
    } catch (e) {
      rethrow;
    }
    return false;
  }

  CerrarSesionBloc({required this.cerrarSesionUsecase})
      : super(CerrarSesionInicial());
}
