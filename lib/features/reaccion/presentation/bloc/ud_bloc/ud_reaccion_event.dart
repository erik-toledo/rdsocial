import 'package:rd_social/features/reaccion/domain/entities/reaccion.dart';

abstract class UdReaccionEvent {}

class PressActualizarReaccion extends UdReaccionEvent {
  final Reaccion reaccion;
  PressActualizarReaccion({required this.reaccion});
}
class PressEliminarReaccion extends UdReaccionEvent {
  final Reaccion reaccion;
  PressEliminarReaccion({required this.reaccion});
}
