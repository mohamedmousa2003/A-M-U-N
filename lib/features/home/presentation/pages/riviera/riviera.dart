import 'package:amun/features/home/presentation/pages/riviera/riviera_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../data/repositories/home_repository_impl.dart';
import '../../../data/data_sources/remote/home_remote_data_source_impl.dart';
import '../../../domain/use_cases/get_riviera_usecase.dart';
import '../../cubit/home_cubit.dart';
import '../../cubit/home_state.dart';
import '../../widgets/home_item_widget.dart';
import '../classical/classical_details_screen.dart';

class Riviera extends StatelessWidget {
  const Riviera({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(
        getRivieraUseCase: GetRivieraUseCase(HomeRepositoryImpl(HomeRemoteDataSourceImpl())),
      )..loadRiviera(),
      child: SizedBox(
        height: 260.h,
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is HomeLoading) return const Center(child: CircularProgressIndicator());

            if (state is RivieraLoading) {
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
                  );
                },
              );
            }

            if (state is HomeError) return Center(child: Text(state.message));

            return const SizedBox();
          },
        ),
      ),
    );
  }
}
