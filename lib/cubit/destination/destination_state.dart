part of 'destination_cubit.dart';

abstract class DestinationState extends Equatable {
  const DestinationState();

  @override
  List<Object> get props => [];
}

class DestinationInitial extends DestinationState {}

class DestinationLoading extends DestinationState {}

class DestinationSuccess extends DestinationState {
  const DestinationSuccess(this.destinations);

  final List<DestinationModel> destinations;

  @override
  List<Object> get props => [destinations];
}

class DestinationFailed extends DestinationState {
  const DestinationFailed(this.error);

  final String error;

  @override
  List<Object> get props => [error];
}
