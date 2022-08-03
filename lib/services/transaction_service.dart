import 'package:airplane/models/transaction_model.dart';
import 'package:airplane/services/user_service.dart';
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
      transaction.userId = UserService().getCurrentUser()!.uid;
      await _transactionRef.add(transaction);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<TransactionModel>> fetchTransactions() async {
    try {
      final _userId = UserService().getCurrentUser()!.uid;
      final querySnapshot = await _transactionRef
          .where('user_id', isEqualTo: _userId)
          .orderBy('created_at', descending: true)
          .get();
      return querySnapshot.docs.map((e) => e.data()).toList();
    } catch (e) {
      rethrow;
    }
  }
}
