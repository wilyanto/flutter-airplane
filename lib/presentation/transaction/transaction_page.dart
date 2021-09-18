import 'package:airplane/cubit/transaction/transaction_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class TransactionPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    useEffect(() {
      context.read<TransactionCubit>().fetchTransactions();
    });

    return BlocBuilder<TransactionCubit, TransactionState>(
      builder: (context, state) {
        if (state is TransactionLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is TransactionSuccess) {
          return Container();
        }
        return Container();
      },
    );
  }
}
