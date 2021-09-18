import 'package:airplane/models/destination_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DestinationService {
  final _destinationRef = FirebaseFirestore.instance
      .collection('destinations')
      .withConverter<DestinationModel>(
        fromFirestore: (snapshot, _) =>
            DestinationModel.fromJson(snapshot.id, snapshot.data()!),
        toFirestore: (destination, _) => destination.toJson(),
      );

  Future<List<DestinationModel>> fetchDestinations() async {
    try {
      final querySnapshot = await _destinationRef.get();
      return querySnapshot.docs.map((e) => e.data()).toList();
    } catch (e) {
      rethrow;
    }
  }
}
