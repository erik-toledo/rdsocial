import 'package:rd_social/features/login/data/datasource/local_data_user.dart';
import 'package:rd_social/features/login/domain/entities/usuario.dart';
import 'package:rd_social/features/login/domain/repositories/local_data_user_repository.dart';

class LocalDataUserRepositoryImpl implements LocalDataUserRepository {
  final LocalDataUser localDataUser;
  LocalDataUserRepositoryImpl({required this.localDataUser});
  @override
  Future<List<Usuario>> datosUsuario() async {
    return await localDataUser.informacionUsuario();
  }
}
