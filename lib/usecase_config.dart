import 'package:rd_social/features/comentario/data/datasource/comentario_remote_data_source.dart';
import 'package:rd_social/features/comentario/data/repositories/comentario_repository_impl.dart';
import 'package:rd_social/features/comentario/data/repositories/comentario_usuario_repository_imp.dart';
import 'package:rd_social/features/comentario/domain/usecases/crear_comentario_usecase.dart';
import 'package:rd_social/features/comentario/domain/usecases/obtener_comentario_usuario_usecase.dart';
import 'package:rd_social/features/login/data/datasource/inicio_sesion_remote.dart';
import 'package:rd_social/features/login/data/datasource/local_data_user.dart';
import 'package:rd_social/features/login/data/repositories/cerrar_sesion_repository_impl.dart';
import 'package:rd_social/features/login/data/repositories/inicio_sesion_respository_impl.dart';
import 'package:rd_social/features/login/data/repositories/local_data_user_repository_impl.dart';
import 'package:rd_social/features/login/domain/usecase/cerrar_sesion_usecase.dart';
import 'package:rd_social/features/login/domain/usecase/iniciar_sesion_usecase.dart';
import 'package:rd_social/features/login/domain/usecase/obtener_datos_usuario_local_usecase.dart';
import 'package:rd_social/features/publicar/data/datasource/publicacion_remote_data_source.dart';
import 'package:rd_social/features/publicar/data/repositories/publicacion_respositori_impl.dart';
import 'package:rd_social/features/publicar/domain/usecase/crear_publicacion_useacase.dart';
import 'package:rd_social/features/publicar/domain/usecase/eliminar_publicacion_usecase.dart';
import 'package:rd_social/features/publicar/domain/usecase/obtener_publicacion_usecase.dart';
import 'package:rd_social/features/publicar/domain/usecase/obtener_publicaciones_amigos_usecase.dart';
import 'package:rd_social/features/publicar/domain/usecase/subir_archivo_usecase.dart';
import 'package:rd_social/features/reaccion/data/datasource/reaccion_remote_data_source.dart';
import 'package:rd_social/features/reaccion/data/repositories/reaccion_repository_impl.dart';
import 'package:rd_social/features/reaccion/domain/usecase/actualizar_reaccion_usecase.dart';
import 'package:rd_social/features/reaccion/domain/usecase/crear_reaccion_usecase.dart';
import 'package:rd_social/features/reaccion/domain/usecase/eliminar_reaccion_usecase.dart';
import 'package:rd_social/features/reaccion/domain/usecase/obtener_reaccion_usecase.dart';

class UsecaseConfig {
  //DataLocal
  LocalDataUserImpl? localDataUserImpl;
  LocalDataUserRepositoryImpl? localDataUserRepositoryImpl;
  //Publicacion
  PublicacionRemoteDataSourceImpl? publicacionRemoteDataSourceImpl;
  PublicacionRepositoryImpl? publicacionRepositoriImpl;
  SubirArchivoUsecase? subirArchivoUsecase;
  CrearPublicacionUsecase? crearPublicacionUsecase;
  ObtenerPublicacionUsecase? obtenerPublicacionUsecase;
  EliminarPublicacionUsecase? eliminarPublicacionUsecase;
  ObtenerPublicacionesAmigosUsecase? obtenerPublicacionesAmigosUsecase;

  //InicioSesión
  InicioSesionRemoteImpl? inicioSesionRemoteImpl;
  InicioSesionRepositoryImpl? inicioSesionRepositoryImpl;
  CerrarSesionRepositoryImpl? cerrarSesionRepositoryImpl;
  IniciarSesionUsecase? iniciarSesionUsecase;
  CerrarSesionUsecase? cerrarSesionUsecase;
  ObtenerDatosUsuarioLocalUsecase? obtenerDatosUsuarioLocalUsecase;

  //Comentario
  ComentarioRemoteDataSourceImpl? comentarioRemoteDataSourceImpl;
  ComentarioRepositoryImpl? comentarioRepositoryImpl;
  ComentarioUsuarioRepositoryImpl? comentarioUsuarioRepositoryImpl;
  CrearComentarioUsecase? crearComentarioUsecase;
  ObtenerComentarioUsuarioUsecase? obtenerComentarioUsuarioUsecase;

  //Reaccion
  ReaccionRemoteDataSourceImpl? reaccionRemoteDataSourceImpl;
  ReaccionRepositoryImpl? reaccionRepositoryImpl;
  ObtenerReaccionUsecase? obtenerReaccionUsecase;
  CrearReaccionUsecase? crearReaccionUsecase;
  EliminarReaccionUsecase? eliminarReaccionUsecase;
  ActualizarReaccionUsecase? actualizarReaccionUsecase;

  //Useconfig
  UsecaseConfig() {
    localDataUserImpl = LocalDataUserImpl();
    localDataUserRepositoryImpl =
        LocalDataUserRepositoryImpl(localDataUser: localDataUserImpl!);

    publicacionRemoteDataSourceImpl = PublicacionRemoteDataSourceImpl();
    publicacionRepositoriImpl = PublicacionRepositoryImpl(
        publicacionRemoteDataSource: publicacionRemoteDataSourceImpl!);

    subirArchivoUsecase =
        SubirArchivoUsecase(publicacionRepositori: publicacionRepositoriImpl!);
    crearPublicacionUsecase = CrearPublicacionUsecase(
        publicacionRepositori: publicacionRepositoriImpl!);
    obtenerPublicacionUsecase = ObtenerPublicacionUsecase(
        publicacionRepositori: publicacionRepositoriImpl!);
    eliminarPublicacionUsecase = EliminarPublicacionUsecase(
        publicacionRepositori: publicacionRepositoriImpl!);
    obtenerPublicacionesAmigosUsecase = ObtenerPublicacionesAmigosUsecase(
        publicacionRepositori: publicacionRepositoriImpl!);

    //InicioSesiónBloc
    inicioSesionRemoteImpl = InicioSesionRemoteImpl();
    inicioSesionRepositoryImpl =
        InicioSesionRepositoryImpl(inicioSesionRemote: inicioSesionRemoteImpl!);
    iniciarSesionUsecase = IniciarSesionUsecase(
        inicioSesionRepositori: inicioSesionRepositoryImpl!);
    cerrarSesionRepositoryImpl =
        CerrarSesionRepositoryImpl(inicioSesionRemote: inicioSesionRemoteImpl!);
    cerrarSesionUsecase = CerrarSesionUsecase(
        cerrarSesionRepositori: cerrarSesionRepositoryImpl!);
    obtenerDatosUsuarioLocalUsecase = ObtenerDatosUsuarioLocalUsecase(
        localDataUserRepository: localDataUserRepositoryImpl!);

    //Comentario
    comentarioRemoteDataSourceImpl = ComentarioRemoteDataSourceImpl();
    comentarioRepositoryImpl = ComentarioRepositoryImpl(
        comentarioRemoteDataSource: comentarioRemoteDataSourceImpl!);
    comentarioUsuarioRepositoryImpl = ComentarioUsuarioRepositoryImpl(
        comentarioRemoteDataSource: comentarioRemoteDataSourceImpl!);
    crearComentarioUsecase =
        CrearComentarioUsecase(comentarioRepository: comentarioRepositoryImpl!);
    obtenerComentarioUsuarioUsecase = ObtenerComentarioUsuarioUsecase(
        comentarioUsuarioRepository: comentarioUsuarioRepositoryImpl!);

    //Reaccion
    reaccionRemoteDataSourceImpl = ReaccionRemoteDataSourceImpl();
    reaccionRepositoryImpl = ReaccionRepositoryImpl(
        reaccionRemoteDataSource: reaccionRemoteDataSourceImpl!);
    obtenerReaccionUsecase =
        ObtenerReaccionUsecase(reaccionRepository: reaccionRepositoryImpl!);
    crearReaccionUsecase =
        CrearReaccionUsecase(reaccionRepository: reaccionRepositoryImpl!);
    eliminarReaccionUsecase =
        EliminarReaccionUsecase(reaccionRepository: reaccionRepositoryImpl!);
    actualizarReaccionUsecase =
        ActualizarReaccionUsecase(reaccionRepository: reaccionRepositoryImpl!);
  }
}
