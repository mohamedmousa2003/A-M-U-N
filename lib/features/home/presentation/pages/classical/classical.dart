import 'package:amun/features/home/presentation/cubit/state/classical_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../favorites/presentation/cubit/favorite_cubit.dart';
import '../../../../favorites/presentation/helpers/favorite_mapper.dart';
import '../../../data/repositories/home_repository_impl.dart';
import '../../../data/data_sources/remote/home_remote_data_source_impl.dart';
import '../../../domain/use_cases/get_classical_usecase.dart';
import '../../cubit/home_cubit/classical_cubit.dart';
import '../../widgets/home_item_widget.dart';
import '../../widgets/home_shimmer.dart';
import 'classical_details_screen.dart';

class Classical extends StatelessWidget {
  const Classical({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => ClassicalCubit(
        getClassicalUseCase: GetClassicalUseCase(HomeRepositoryImpl(HomeRemoteDataSourceImpl())),
      )..loadClassical(),
      child: SizedBox(
        height: 260.h,
        child: BlocBuilder<ClassicalCubit, ClassicalState>(
          builder: (context, state) {
            if (state is LoadingClassicalState) {
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (_, _) => const HomeShimmerItem(),
              );
            }

            if (state is LoadedClassicalState) {
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.classical.length,
                itemBuilder: (context, index) {
                  final item = state.classical[index];
                  return HomeItemWidget(
                    image: item.imageUrl ?? '',
                    location: item.name ?? '',
                    price: 'EGP ${item.cost}',
                    rating: item.rating?.toDouble() ?? 0.0,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ClassicalDetailsScreen(
                            classical: item,
                          ),
                        ),
                      );
                    },
                    onFavouriteTap: () {
                      context.read<FavoriteCubit>().toggleFavorite(
                        classicalToFavorite(item),
                      );
                    },

                  );
                },
              );
            }

            if (state is ErrorClassicalState) return Center(child: Text(state.error));

            return const SizedBox();
          },
        ),
      ),
    );
  }
}
