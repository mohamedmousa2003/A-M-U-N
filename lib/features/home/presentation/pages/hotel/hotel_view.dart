
import 'package:amun/features/home/data/repositories/home_repository_impl.dart';
import 'package:amun/features/home/presentation/cubit/home_cubit/hotel_cubit.dart';
import 'package:amun/features/home/presentation/cubit/state/hotel_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/data_sources/remote/home_remote_data_source_impl.dart';
import '../../../domain/use_cases/get_hotels_usecase.dart';
import '../../widgets/home_shimmer.dart';
import '../../widgets/hotel_item_widget.dart';
import 'hotel_details_screen.dart';

class HotelView extends StatelessWidget {
  const HotelView({super.key});
  static const String routeName = "hotel";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HotelCubit(
         GetHotelsUseCase(
          HomeRepositoryImpl(HomeRemoteDataSourceImpl()),
        ),
      )..loadHotels(),
      child: BlocBuilder<HotelCubit, HotelState>(
        builder: (context, state) {
          if (state is LoadingHotelState) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (_, _) => const HomeShimmerItem(),
            );
          }

          if (state is LoadedHotelState) {
            return SizedBox(
              height: 260.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.hotel.length,
                itemBuilder: (context, index) {
                  final item = state.hotel[index];

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


          if (state is ErrorHotelState) {
            return Center(child: Text(state.error));
          }

          return const SizedBox();
        },
      ),
    );
  }
}
