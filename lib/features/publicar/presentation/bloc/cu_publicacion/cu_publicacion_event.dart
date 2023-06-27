part of 'cu_publicacion_bloc.dart';

@immutable
abstract class CuPublicacionEvent {}

class PressUploadFileButton extends CuPublicacionEvent {
  final String path;
  final File file;

  PressUploadFileButton({required this.path, required this.file});
}

class PressCreatePublicationButton extends CuPublicacionEvent {
  final Publicacion publicacion;

  PressCreatePublicationButton({required this.publicacion});
}

class ReinicioEvent extends CuPublicacionEvent {}
