import 'package:equatable/equatable.dart';

class DestinationModel extends Equatable {
  const DestinationModel({
    required this.id,
    required this.name,
    required this.city,
    required this.imageUrl,
    this.rating = 0.0,
    this.price = 0,
  });

  factory DestinationModel.fromJson(String id, Map<String, dynamic> json) =>
      DestinationModel(
        id: id,
        name: json['name'] as String,
        city: json['city'] as String,
        imageUrl: json['image_url'] as String,
        rating: (json['rating'] as num).toDouble(),
        price: json['price'] as int,
      );

  final String id;
  final String name;
  final String city;
  final String imageUrl;
  final double rating;
  final int price;

  @override
  List<Object?> get props => [id, name, city, imageUrl, rating, price];
}
