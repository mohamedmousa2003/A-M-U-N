import 'package:amun/features/home/presentation/cubit/state/classical_state.dart';
import 'package:bloc/bloc.dart';

import '../../../domain/entities/classical_entity.dart';
import '../../../domain/use_cases/get_classical_usecase.dart';

class ClassicalCubit extends Cubit<ClassicalState>{
  ClassicalCubit({required this.getClassicalUseCase}):super(InitialClassicalState());
  final GetClassicalUseCase getClassicalUseCase;

  Future<void> loadClassical() async {
    emit(LoadingClassicalState());
    try {
      final List<ClassicalEntity> classical = await getClassicalUseCase();
      emit(LoadedClassicalState(classical: classical));
    } catch (e) {
      emit(ErrorClassicalState( error: e.toString(),));
    }
  }

}