import '../../../domain/entities/riviera_entity.dart';

abstract class RivieraState {}
class InitialRivieraState extends RivieraState{}
class ErrorRivieraState extends RivieraState{
  final String error;
  ErrorRivieraState({required this.error});
}
class LoadingRivieraState extends RivieraState{}
class LoadedRivieraState extends RivieraState{
  final List<RivieraEntity> riviera;
  LoadedRivieraState({required this.riviera});
}