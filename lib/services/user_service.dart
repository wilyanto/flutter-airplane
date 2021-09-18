import 'package:airplane/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserService {
  final _userReference =
      FirebaseFirestore.instance.collection('users').withConverter<UserModel>(
            fromFirestore: (snapshot, _) =>
                UserModel.fromJson(snapshot.data()!, snapshot.id),
            toFirestore: (user, _) => user.toJson(),
          );

  Future<void> setUser(UserModel user) async {
    try {
      await _userReference.doc(user.id).set(user);
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> getUserById(String id) async {
    try {
      final userModel = (await _userReference.doc(id).get()).data()!;
      return userModel;
    } catch (e) {
      rethrow;
    }
  }
}
