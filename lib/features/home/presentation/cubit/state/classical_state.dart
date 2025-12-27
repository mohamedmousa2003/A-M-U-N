import '../../../domain/entities/classical_entity.dart';

abstract class ClassicalState {}

class InitialClassicalState extends ClassicalState{}
class ErrorClassicalState extends ClassicalState{
  final String error;
  ErrorClassicalState({required this.error});
}
class LoadingClassicalState extends ClassicalState{}
class LoadedClassicalState extends ClassicalState{
  final List<ClassicalEntity> classical;
  LoadedClassicalState({required this.classical});
}
