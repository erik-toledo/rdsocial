import 'package:rd_social/features/login/data/datasource/inicio_sesion_remote.dart';
import 'package:rd_social/features/login/domain/repositories/cerrar_sesion_repositori.dart';

class CerrarSesionRepositoryImpl implements CerrarSesionRepositori {
  final InicioSesionRemote inicioSesionRemote;

  CerrarSesionRepositoryImpl({required this.inicioSesionRemote});

  @override
  Future<bool> cerrarSesion() async {
    return await inicioSesionRemote.cerrarSesion();
  }
}
