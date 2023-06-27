import 'package:rd_social/features/reaccion/domain/entities/reaccion.dart';

class ReaccionModel extends Reaccion {
  ReaccionModel({
    required String idPublicacion,
    required String idUsuario,
    required String cantidadReacciones,
    required String idReaccion,
  }) : super(
            idPublicacion: idPublicacion,
            idUsuario: idUsuario,
            cantidadReacciones: cantidadReacciones,
            idReaccion: idReaccion);

  factory ReaccionModel.fromEntity(Reaccion reaccion) {
    return ReaccionModel(
      idPublicacion: reaccion.idPublicacion,
      idUsuario: reaccion.idUsuario,
      cantidadReacciones: reaccion.cantidadReacciones,
      idReaccion: reaccion.idReaccion,
    );
  }

  factory ReaccionModel.fromJson(Map<String, dynamic> json) {
    return ReaccionModel(
      idPublicacion: json["idpublicacion"].toString(),
      idUsuario: json["idusuario"],
      cantidadReacciones: json["cantidadreaccion"],
      idReaccion: json["idreaccion"].toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "idPublicacion": idPublicacion,
      "idUsuario": idUsuario,
      "cantidadReacciones": cantidadReacciones,
      "idReaccion": idReaccion,
    };
  }
}
