abstract class UdReaccionState {}

class UdReaccionInicial extends UdReaccionState {}

class UdActualizandoReaccion extends UdReaccionState {}

class UdReaccionActualizada extends UdReaccionState {}

class UdReaccionError extends UdReaccionState {
  final String error;

  UdReaccionError({required this.error});
}

class UdEliminarReaccion extends UdReaccionState {}

class UdReaccionEliminar extends UdReaccionState {}

class UdReaccionEliminarError extends UdReaccionState {
  final String error;

  UdReaccionEliminarError({required this.error});
}
