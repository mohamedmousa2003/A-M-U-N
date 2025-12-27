import 'package:amun/features/home/presentation/cubit/state/riviera_state.dart';
import 'package:bloc/bloc.dart';
import '../../../domain/entities/riviera_entity.dart';
import '../../../domain/use_cases/get_riviera_usecase.dart';
class RivieraCubit extends Cubit<RivieraState>{
  final GetRivieraUseCase? getRivieraUseCase;
  RivieraCubit(this.getRivieraUseCase):super(InitialRivieraState());

  Future<void> loadRiviera() async {
    emit(LoadingRivieraState());
    try {
      final List<RivieraEntity> riviera = await getRivieraUseCase!();
      emit(LoadedRivieraState(riviera: riviera));
    } catch (e) {
      emit(ErrorRivieraState(error: e.toString()));
    }
  }
}