import 'package:rd_social/features/login/domain/repositories/inicio_sesion_repositori.dart';

class IniciarSesionUsecase {
  final InicioSesionRepositori inicioSesionRepositori;

  IniciarSesionUsecase({required this.inicioSesionRepositori});

  Future<bool> execute(String opcion) async {
    return await inicioSesionRepositori.iniciarSesion(opcion);
  }
}
