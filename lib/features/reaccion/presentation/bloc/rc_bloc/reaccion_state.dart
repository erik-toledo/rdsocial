part of 'reaccion_bloc.dart';

@immutable
abstract class ReaccionState {}

class ReaccionEventInicial extends ReaccionState {}

class ReaccionObteniendoReaccion extends ReaccionState {}

class ReaccionObtenida extends ReaccionState {
  final Reaccion reaccion;

  ReaccionObtenida({required this.reaccion});
}

class ReaccionError extends ReaccionState {
  final String error;

  ReaccionError({required this.error});
}
