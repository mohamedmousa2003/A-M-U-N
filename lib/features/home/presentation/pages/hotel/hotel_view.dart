
import 'package:amun/features/home/data/repositories/home_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/data_sources/remote/home_remote_data_source_impl.dart';
import '../../../domain/use_cases/get_hotels_usecase.dart';
import '../../cubit/home_cubit.dart';
import '../../cubit/home_state.dart';
import '../../widgets/hotel_item_widget.dart';
import 'hotel_details_screen.dart';

class HotelView extends StatelessWidget {
  const HotelView({super.key});
  static const String routeName = "hotel";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(
        getHotelsUseCase: GetHotelsUseCase(
          HomeRepositoryImpl(HomeRemoteDataSourceImpl()),
        ),
      )..loadHotels(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is HotelsLoading) {
            return SizedBox(
              height: 260.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.hotels.length,
                itemBuilder: (context, index) {
                  final item = state.hotels[index];

                  return HotelItemWidget(
                    title: item.name ?? "",
                    checkIn: item.checkIn ??"",
                    checkOut: item.checkOut?? "",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => HotelDetailsScreen(
                            hotel: item, // 👈 أهم سطر
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            );
          }


          if (state is HomeError) {
            return Center(child: Text(state.message));
          }

          return const SizedBox();
        },
      ),
    );
  }
}
