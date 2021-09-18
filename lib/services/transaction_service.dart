import 'package:airplane/models/transaction_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TransactionService {
  final _transactionRef = FirebaseFirestore.instance
      .collection('transactions')
      .withConverter<TransactionModel>(
        fromFirestore: (snapshot, _) =>
            TransactionModel.fromJson(snapshot.id, snapshot.data()!),
        toFirestore: (transaction, _) => transaction.toJson(),
      );

  Future<void> createTransaction(TransactionModel transaction) async {
    try {
      transaction.createdAt = DateTime.now();
      await _transactionRef.add(transaction);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<TransactionModel>> fetchTransactions() async {
    try {
      final querySnapshot =
          await _transactionRef.orderBy('created_at', descending: true).get();
      return querySnapshot.docs.map((e) => e.data()).toList();
    } catch (e) {
      rethrow;
    }
  }
}
