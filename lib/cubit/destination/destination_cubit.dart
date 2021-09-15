import 'package:airplane/models/destination_model.dart';
import 'package:airplane/services/destination_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'destination_state.dart';

class DestinationCubit extends Cubit<DestinationState> {
  DestinationCubit() : super(DestinationInitial());

  Future<void> fetchDestinations() async {
    try {
      emit(DestinationLoading());
      final destinations = await DestinationService().fetchDestinations();
      emit(DestinationSuccess(destinations));
    } catch (e) {
      emit(DestinationFailed(e.toString()));
  }
  }
}
