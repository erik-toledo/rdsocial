abstract class CerrarSesionState {}

class CerrarSesionInicial extends CerrarSesionState {}

class CerrandoSesion extends CerrarSesionState {}

class SesionCerrada extends CerrarSesionState {}

class ErrorCerrarSesion extends CerrarSesionState {
  final String message;

  ErrorCerrarSesion({required this.message});
}
