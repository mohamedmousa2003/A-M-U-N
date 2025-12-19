import 'package:amun/features/home/domain/use_cases/get_riviera_usecase.dart';
import 'package:bloc/bloc.dart';
import '../../domain/entities/classical_entity.dart';
import '../../domain/entities/hotel_entity.dart';
import '../../domain/entities/riviera_entity.dart';
import '../../domain/use_cases/get_classical_usecase.dart';
import '../../domain/use_cases/get_hotels_usecase.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetHotelsUseCase? getHotelsUseCase;
  final GetClassicalUseCase? getClassicalUseCase;
  final GetRivieraUseCase? getRivieraUseCase;

  HomeCubit({
     this.getHotelsUseCase,
     this.getClassicalUseCase,
     this.getRivieraUseCase,
  }) : super(HomeInitial());

  /// Load Hotels
  Future<void> loadHotels() async {
    try {
      emit(HotelsLoading(hotels: const []));
      final List<HotelEntity> hotels = await getHotelsUseCase!();
      emit(HotelsLoading(hotels: hotels));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }

  /// Load Classical Highlights
  Future<void> loadClassical() async {
    try {
      emit(ClassicalLoading(classical: const []));
      final List<ClassicalEntity> classical =
      await getClassicalUseCase!();
      emit(ClassicalLoading(classical: classical));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }

  /// Load Riviera Highlights
  Future<void> loadRiviera() async {
    try {
      emit(RivieraLoading(riviera: const []));
      final List<RivieraEntity> riviera =
      await getRivieraUseCase!();
      emit(RivieraLoading(riviera: riviera));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }
}
