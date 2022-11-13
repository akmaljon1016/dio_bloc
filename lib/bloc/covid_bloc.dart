import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio_bloc/resources/api-repository.dart';
import 'package:equatable/equatable.dart';

import '../model/covid_model.dart';

part 'covid_event.dart';

part 'covid_state.dart';

class CovidBloc extends Bloc<CovidEvent, CovidState> {
  CovidBloc() : super(CovidInitial()) {
    final ApiRepository apiRepository = ApiRepository();

    on<CovidEvent>((event, emit) async {
      try {
        emit(CovidLoading());
        final covidList = await apiRepository.fetchCovidList();
        emit(CovidLoaded(covidList));
        if (covidList.error != null) {
          emit(CovidError(covidList.error));
        }
      } on NetworkError {
        emit(CovidError('Failed to fetch  data.is your device online'));
      }
    });
  }
}
