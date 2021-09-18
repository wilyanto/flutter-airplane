import 'package:airplane/models/transaction_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TransactionService {
  final _transactionReference = FirebaseFirestore.instance
      .collection('transactions')
      .withConverter<TransactionModel>(
        fromFirestore: (snapshot, _) =>
            TransactionModel.fromJson(snapshot.data()!),
        toFirestore: (transaction, _) => transaction.toJson(),
      );

  Future<void> createTransaction(TransactionModel transaction) async {
    try {
      await _transactionReference.add(transaction);
    } catch (e) {
      rethrow;
    }
  }
}
