import 'package:rd_social/features/login/data/datasource/inicio_sesion_remote.dart';
import 'package:rd_social/features/login/domain/repositories/inicio_sesion_repositori.dart';

class InicioSesionRepositoryImpl implements InicioSesionRepositori {
  final InicioSesionRemote inicioSesionRemote;

  InicioSesionRepositoryImpl({required this.inicioSesionRemote});

  @override
  Future<bool> iniciarSesion(String opcion) async {
    return await inicioSesionRemote.inicioSesion(opcion);
  }
}
