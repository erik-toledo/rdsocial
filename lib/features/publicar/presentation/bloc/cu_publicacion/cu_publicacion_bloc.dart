import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rd_social/features/publicar/domain/entities/publicacion.dart';
import 'package:rd_social/features/publicar/domain/usecase/crear_publicacion_useacase.dart';
import 'package:rd_social/features/publicar/domain/usecase/subir_archivo_usecase.dart';
part 'cu_publicacion_event.dart';
part 'cu_publicacion_state.dart';

class CuPublicacionBloc extends Bloc<CuPublicacionEvent, CuPublicacionState> {
  final SubirArchivoUsecase subirArchivoUsecase;
  final CrearPublicacionUsecase crearPublicacionUsecase;

  Future<String> publicar(Publicacion publicacion) async {
    try {
      String response = await crearPublicacionUsecase.execute(publicacion);
      if (response.isNotEmpty) return response;
    } catch (e) {
      rethrow;
    }
    return "";
  }

  CuPublicacionBloc(
      {required this.subirArchivoUsecase,
      required this.crearPublicacionUsecase})
      : super(CuPublicacionInicial()) {
    on<CuPublicacionEvent>((event, emit) async {
      if (event is PressUploadFileButton) {
        try {
          emit(SavingFile());
          String response =
              await subirArchivoUsecase.execute(event.path, event.file);
          emit(FileSaved(ruta: response));
        } catch (e) {
          emit(ErrorSavingFile(message: e.toString()));
        }
      }
      if (event is ReinicioEvent) {
        emit(CuPublicacionInicial());
      }
    });
  }
}
