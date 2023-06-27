import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rd_social/features/login/domain/entities/usuario.dart';
import 'package:rd_social/features/login/domain/usecase/iniciar_sesion_usecase.dart';
import 'package:rd_social/features/login/domain/usecase/obtener_datos_usuario_local_usecase.dart';
part 'inicio_sesion_event.dart';
part 'inicio_sesion_state.dart';

class InicioSesionBloc extends Bloc<InicioSesionEvent, InicioSesionState> {
  final IniciarSesionUsecase iniciarSesionUsecase;
  final ObtenerDatosUsuarioLocalUsecase obtenerDatosUsuarioLocalUsecase;
  Future<bool> iniciosesion(String opcion) async {
    try {
      bool response = await iniciarSesionUsecase.execute(opcion);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Usuario>> obtnerDatosUsuarioLocal() async {
    try {
      return await obtenerDatosUsuarioLocalUsecase.execute();
    } catch (e) {
      rethrow;
    }
  }

  InicioSesionBloc(
      {required this.iniciarSesionUsecase,
      required this.obtenerDatosUsuarioLocalUsecase})
      : super(InicioSesionInicial());
}
