import 'package:amun/features/trip/presentation/pages/create_plan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:amun/core/utils/app_colors.dart';
import '../../../../core/constant/text.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../../../core/utils/components/main_text_form_field.dart';
import '../../data/data_sources/remote/trip_remote_data_source_impl.dart';
import '../../data/repositories/trip_repository_impl.dart';
import '../../domain/use_cases/create_trip_use_cases.dart';
import '../cubit/trip_cubit.dart';
import '../cubit/trip_state.dart';

class TripScreen extends StatefulWidget {
  const TripScreen({super.key});

  @override
  State<TripScreen> createState() => _TripScreenState();
}

class _TripScreenState extends State<TripScreen> {
  final TextEditingController numberOfDayController = TextEditingController();
  final TextEditingController budgetController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    numberOfDayController.dispose();
    budgetController.dispose();
    super.dispose();
  }

  void _submitForm(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      final days = int.parse(numberOfDayController.text);
      final budget = double.parse(budgetController.text);
      context.read<TripCubit>().fetchTrip(days: days, budget: budget);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: BlocProvider(
        create: (context) => TripCubit(
          CreateTripUseCase(
            TripRepositoryImpl(TripRepositorySourceImpl()),
          ),
        ),
        child: BlocConsumer<TripCubit, TripState>(
          listener: (context, state) {
            if (state is TripLoaded) {
              final firstDay = state.trip.tripPlan.first;
              final firstPlace = firstDay.places.first;
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => CreatePlan(place: firstPlace),
                ),
              );
            } else if (state is TripError) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          builder: (context, state) {
            return Scaffold(
              backgroundColor: AppColor.backgroundColor,
              appBar: AppBar(
                backgroundColor: AppColor.backgroundColor,
                elevation: 0,
                centerTitle: true,
                title: Text(
                  tripPlanner,
                  style:
                  AppTextStyle.size23.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              body: SingleChildScrollView(
                padding: EdgeInsets.all(16.w),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(discoverEgypt, style: AppTextStyle.size14),
                      SizedBox(height: 20.h),

                      // Number of Days
                      TextFormFieldWidget(
                        hintText: yourNumber,
                        title: numberOfDAy,
                        prefixIcon: const Icon(Icons.numbers, size: 25),
                        controller: numberOfDayController,
                        myValidator: (text) {
                          if (text == null || text.isEmpty) {
                            return pleaseEnterNumber;
                          }
                          if (int.tryParse(text) == null ||
                              int.parse(text) <= 0) {
                            return enterValidNumber;
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 15.h),

                      // Budget
                      TextFormFieldWidget(
                        hintText: 'Enter your budget',
                        title: 'Budget',
                        prefixIcon:
                        const Icon(Icons.attach_money_outlined, size: 28),
                        controller: budgetController,
                        myValidator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'Please enter your budget';
                          }
                          if (double.tryParse(text) == null ||
                              double.parse(text) <= 0) {
                            return 'Enter a valid budget';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 40.h),

                      // Submit Button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () => _submitForm(context),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 14.h),
                          ),
                          child: Text(
                            myTrip,
                            style: AppTextStyle.size16.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),

                      if (state is TripLoading)
                        Center(
                          child: CircularProgressIndicator(
                            color: AppColor.primary,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
