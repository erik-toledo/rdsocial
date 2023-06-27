import 'package:rd_social/features/login/domain/entities/usuario.dart';
import 'package:rd_social/features/login/domain/repositories/local_data_user_repository.dart';

class ObtenerDatosUsuarioLocalUsecase {
  final LocalDataUserRepository localDataUserRepository;

  ObtenerDatosUsuarioLocalUsecase({required this.localDataUserRepository});

  Future<List<Usuario>> execute() async {
    return await localDataUserRepository.datosUsuario();
  }
}
