import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:opennutritracker/core/domain/entity/intake_entity.dart';
import 'package:opennutritracker/core/domain/usecase/get_intake_usecase.dart';
import 'package:opennutritracker/core/domain/usecase/get_user_usecase.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetIntakeUsecase getIntakeUsecase = GetIntakeUsecase();
  final GetUserUsecase getUserUsecase = GetUserUsecase();

  HomeBloc() : super(HomeInitial()) {
    on<LoadItemsEvent>((event, emit) async {
      emit(HomeLoadingState());

      final user = await getUserUsecase.getUserData(event.context);
      final breakfastIntakeList =
          await getIntakeUsecase.getTodayBreakfastIntake(event.context);
      final lunchIntakeList =
          await getIntakeUsecase.getTodayLunchIntake(event.context);
      final dinnerIntakeList =
          await getIntakeUsecase.getTodayDinnerIntake(event.context);
      final snackIntakeList =
          await getIntakeUsecase.getTodaySnackIntake(event.context);

      emit(HomeLoadedState(
          // TODO emit user state
          breakfastIntakeList: breakfastIntakeList,
          lunchIntakeList: lunchIntakeList,
          dinnerIntakeList: dinnerIntakeList,
          snackIntakeList: snackIntakeList));
    });
  }
}