part of 'cu_publicacion_bloc.dart';

@immutable
abstract class CuPublicacionState {}

class CuPublicacionInicial extends CuPublicacionState {}

class CuSavingPublicacion extends CuPublicacionState {}

class CuPublicacionSaved extends CuPublicacionState {}

class ErrorSavingPublicacion extends CuPublicacionState {
  final String message;

  ErrorSavingPublicacion({required this.message});
}

class SavingFile extends CuPublicacionState {}

class FileSaved extends CuPublicacionState {
  final String ruta;
  FileSaved({required this.ruta});
}

class ErrorSavingFile extends CuPublicacionState {
  final String message;

  ErrorSavingFile({required this.message});
}
