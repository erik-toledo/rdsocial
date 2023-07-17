import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rd_social/features/publicar/domain/usecase/eliminar_publicacion_usecase.dart';
import 'package:rd_social/features/publicar/domain/usecase/obtener_publicacion_usecase.dart';
import 'package:rd_social/features/publicar/domain/usecase/obtener_publicaciones_amigos_usecase.dart';

import '../../../domain/entities/obtener_publicacion.dart';

part 'rd_publicacion_state.dart';
part 'rd_publicacion_event.dart';

class RdPublicacionBloc extends Bloc<RdPublicacionEvent, RdPublicacionState> {
  final ObtenerPublicacionUsecase extraerPublicacionUsecase;
  final EliminarPublicacionUsecase eliminarPublicacionUsecase;
  final ObtenerPublicacionesAmigosUsecase obtenerPublicacionesAmigosUsecase;

  Future<List<ObtenerPublicacion>> extraerCoordenadas() async {
    List<ObtenerPublicacion> publicaciones =
        await obtenerPublicacionesAmigosUsecase.execute();
    return publicaciones;
  }

  RdPublicacionBloc(
      {required this.extraerPublicacionUsecase,
      required this.eliminarPublicacionUsecase,
      required this.obtenerPublicacionesAmigosUsecase})
      : super(RdPublicacionInitial()) {
    on<RdPublicacionEvent>((event, emit) async {
      if (event is GetPublicacion) {
        try {
          emit(RdObteniendoPublicaciones());
          List<ObtenerPublicacion> publicacionesMuro =
              await extraerPublicacionUsecase.execute(event.idUsuario);
          emit(RdPublicacionesObtenidas(publicacionesMuro: publicacionesMuro));
        } catch (e) {
          emit(ErrorGetPublicacion(error: e.toString()));
        }
      } else if (event is PressDeletePublicacion) {
        try {
          emit(DeletingPublicacion());
          await eliminarPublicacionUsecase.execute(event.id);
          emit(PublicacionDeleted());
        } catch (e) {
          emit(ErrorDeletingPublicacion(error: e.toString()));
        }
      } else if (event is PressReinicioEvent) {
        emit(RdPublicacionInitial());
      } else if (event is ObtenerPublicaciones) {
        try {
          emit(RdObteniendoPublicacionesAmigos());
          List<ObtenerPublicacion> response =
              await obtenerPublicacionesAmigosUsecase.execute();
          emit(RdPublicacionesObtenidasAmigos(publicaciones: response));
        } catch (e) {
          emit(ErrorGetPublicacion(error: e.toString()));
        }
      }
    });
  }
}
