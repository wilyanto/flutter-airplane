import 'package:airplane/cubit/bottom_navigation/page_cubit.dart';
import 'package:airplane/cubit/transaction/transaction_cubit.dart';
import 'package:airplane/presentation/core/widgets/cta_button.dart';
import 'package:airplane/presentation/transaction/widgets/transaction_card.dart';
import 'package:airplane/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lottie/lottie.dart';

class TransactionPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    useEffect(() {
      context.read<TransactionCubit>().fetchTransactions();
      return null;
    });

    return BlocBuilder<TransactionCubit, TransactionState>(
      builder: (context, state) {
        if (state is TransactionLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is TransactionSuccess) {
          if (state.transactions.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset('assets/airplane.json', width: 220),
                  Text(
                    "There's no transaction yet.",
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: defaultMargin * 2),
                  CtaButton(
                    title: 'Travel Now',
                    width: 180,
                    onPressed: () {
                      context.read<PageCubit>().setSelectedPageIndex(0);
                    },
                  ),
                ],
              ),
            );
          }
          return ListView.builder(
            itemCount: state.transactions.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                    child: TransactionCard(
                      transaction: state.transactions[index],
                    ),
                  ),
                  if (index == state.transactions.length - 1)
                    SizedBox(height: defaultMargin * 5),
                ],
              );
            },
          );
        }
        return Container();
      },
    );
  }
}
