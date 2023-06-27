import 'package:rd_social/features/login/domain/repositories/cerrar_sesion_repositori.dart';

class CerrarSesionUsecase {
  final CerrarSesionRepositori cerrarSesionRepositori;

  CerrarSesionUsecase({required this.cerrarSesionRepositori});

  Future<bool> execute() async {
    return await cerrarSesionRepositori.cerrarSesion();
  }
}
