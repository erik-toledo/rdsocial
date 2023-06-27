import 'package:rd_social/features/login/domain/entities/usuario.dart';

abstract class LocalDataUserRepository{
  Future<List<Usuario>> datosUsuario();
}