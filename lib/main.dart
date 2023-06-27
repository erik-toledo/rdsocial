import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rd_social/features/login/presentation/bloc/cerrar_sesion/cerrar_sesion_bloc.dart';
import 'package:rd_social/features/login/presentation/page/login_page.dart';
import 'package:rd_social/features/publicar/presentation/bloc/cu_publicacion/cu_publicacion_bloc.dart';
import 'package:rd_social/features/publicar/presentation/bloc/rd_publicacion/rd_publicacion_bloc.dart';
import 'package:rd_social/features/reaccion/presentation/bloc/ud_bloc/ud_reaccion_bloc.dart';
//import 'package:rd_social/features/publicar/presentation/page/publicacion_detalle_page.dart';
// import 'package:rd_social/features/publicar/presentation/page/feed_page.dart';
import 'package:rd_social/firebase_options.dart';
//import 'package:rd_social/navbar/navbar_route.dart';
import 'package:rd_social/usecase_config.dart';

import 'features/comentario/presentation/bloc/cr_comentario/cr_comentario_bloc.dart';
import 'features/login/presentation/bloc/inicio_sesion/inicio_sesion_bloc.dart';
import 'features/reaccion/presentation/bloc/rc_bloc/reaccion_bloc.dart';

//import 'navbar/navbar_route.dart';

UsecaseConfig usecaseConfig = UsecaseConfig();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CuPublicacionBloc>(
          create: (BuildContext context) => CuPublicacionBloc(
              subirArchivoUsecase: usecaseConfig.subirArchivoUsecase!,
              crearPublicacionUsecase: usecaseConfig.crearPublicacionUsecase!),
        ),
        BlocProvider<RdPublicacionBloc>(
          create: (context) => RdPublicacionBloc(
              extraerPublicacionUsecase:
                  usecaseConfig.obtenerPublicacionUsecase!,
              eliminarPublicacionUsecase:
                  usecaseConfig.eliminarPublicacionUsecase!,
              obtenerPublicacionesAmigosUsecase:
                  usecaseConfig.obtenerPublicacionesAmigosUsecase!),
        ),
        BlocProvider<InicioSesionBloc>(
          create: (context) => InicioSesionBloc(
              iniciarSesionUsecase: usecaseConfig.iniciarSesionUsecase!,
              obtenerDatosUsuarioLocalUsecase:
                  usecaseConfig.obtenerDatosUsuarioLocalUsecase!),
        ),
        BlocProvider<CerrarSesionBloc>(
          create: (context) => CerrarSesionBloc(
            cerrarSesionUsecase: usecaseConfig.cerrarSesionUsecase!,
          ),
        ),
        BlocProvider<CrComentarioBloc>(
          create: (context) => CrComentarioBloc(
            comentarioUsecase: usecaseConfig.crearComentarioUsecase!,
            obtenerComentarioUsuarioUsecase:
                usecaseConfig.obtenerComentarioUsuarioUsecase!,
          ),
        ),
        BlocProvider<ReaccionBloc>(
          create: (context) => ReaccionBloc(
            obtenerReaccionUsecase: usecaseConfig.obtenerReaccionUsecase!,
            crearReaccionUsecase: usecaseConfig.crearReaccionUsecase!,
          ),
        ),
        BlocProvider<UdReaccionBloc>(
          create: (context) => UdReaccionBloc(
              actualizarReaccionUsecase:
                  usecaseConfig.actualizarReaccionUsecase!,
              eliminarReaccionUsecase: usecaseConfig.eliminarReaccionUsecase!),
        )
      ],
      child: MaterialApp(
          title: 'RD Social',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const LoginPage() //const NavbarRoute()  ,
          ),
    );
  }
}
