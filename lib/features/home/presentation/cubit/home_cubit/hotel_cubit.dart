import 'package:amun/features/home/presentation/cubit/state/hotel_state.dart';
import 'package:bloc/bloc.dart';

import '../../../domain/entities/hotel_entity.dart';
import '../../../domain/use_cases/get_hotels_usecase.dart';

class HotelCubit extends Cubit<HotelState>{
  final GetHotelsUseCase? getHotelsUseCase;
  HotelCubit(this.getHotelsUseCase):super(InitialHotelState());

  Future<void> loadHotels() async {
    try {
      emit(LoadingHotelState());
      final List<HotelEntity> hotels = await getHotelsUseCase!();
      emit(LoadedHotelState(hotel: hotels));
    } catch (e) {
      emit(ErrorHotelState(error: e.toString()));
    }
  }
}