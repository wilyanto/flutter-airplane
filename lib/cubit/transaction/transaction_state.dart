part of 'transaction_cubit.dart';

abstract class TransactionState extends Equatable {
  const TransactionState();

  @override
  List<Object> get props => [];
}

class TransactionInitial extends TransactionState {}

class TransactionLoading extends TransactionState {}

class TransactionFailed extends TransactionState {
  const TransactionFailed(this.error);

  final String error;

  @override
  List<Object> get props => [];
}

class TransactionSuccess extends TransactionState {}
