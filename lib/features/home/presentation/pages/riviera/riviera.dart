import 'package:amun/features/home/presentation/cubit/state/riviera_state.dart';
import 'package:amun/features/home/presentation/pages/riviera/riviera_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../favorites/presentation/cubit/favorite_cubit.dart';
import '../../../../favorites/presentation/helpers/favorite_mapper.dart';
import '../../../data/repositories/home_repository_impl.dart';
import '../../../data/data_sources/remote/home_remote_data_source_impl.dart';
import '../../../domain/use_cases/get_riviera_usecase.dart';
import '../../cubit/home_cubit/riviera_cubit.dart';
import '../../widgets/home_item_widget.dart';
import '../../widgets/home_shimmer.dart';


class Riviera extends StatelessWidget {
  const Riviera({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RivieraCubit(
         GetRivieraUseCase(HomeRepositoryImpl(HomeRemoteDataSourceImpl())),
      )..loadRiviera(),
      child: SizedBox(
        height: 260.h,
        child: BlocBuilder<RivieraCubit, RivieraState>(
          builder: (context, state) {
            if (state is LoadingRivieraState){
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (_, _) => const HomeShimmerItem(),
              );
            }

            if (state is LoadedRivieraState) {
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.riviera.length,
                itemBuilder: (context, index) {
                  final item = state.riviera[index];
                  return HomeItemWidget(
                    image: item.imageUrl ?? '',
                    location: item.name ?? '',
                    price: 'EGP ${item.cost}',
                    rating: item.rating?.toDouble() ?? 0.0,
                    onTap:  () => Navigator.push(
                    context, MaterialPageRoute(
                      builder: (_) => RivieraDetailsScreen(
                        riviera: item, // 👈 أهم سطر
                      ),
                    ),
                    ),
                    onFavouriteTap: () {
                      context.read<FavoriteCubit>().toggleFavorite(
                        rivieraToFavorite(item),
                      );
                    },
                  );
                },
              );
            }

            if (state is ErrorRivieraState) return Center(child: Text(state.error));

            return const SizedBox();
          },
        ),
      ),
    );
  }
}
