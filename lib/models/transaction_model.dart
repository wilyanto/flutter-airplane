import 'package:airplane/models/destination_model.dart';
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class TransactionModel extends Equatable {
  TransactionModel({
    this.id = '',
    required this.destination,
    this.amountOfTraveler = 0,
    this.selectedSeats = '',
    this.isInsurance = false,
    this.isRefundable = false,
    this.vat = 0,
    this.price = 0,
    this.grandTotal = 0,
    this.createdAt,
  });

  factory TransactionModel.fromJson(String id, Map<String, dynamic> json) =>
      TransactionModel(
        id: id,
        destination: DestinationModel.fromJson(
          json['destination']['id'] as String,
          json['destination'] as Map<String, dynamic>,
        ),
        amountOfTraveler: json['amount_of_travelers'] as int,
        selectedSeats: json['selected_seat'] as String,
        isInsurance: json['is_insurance'] as bool,
        isRefundable: json['is_refundable'] as bool,
        vat: json['vat'] as double,
        price: json['price'] as int,
        grandTotal: json['grand_total'] as int,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.fromMillisecondsSinceEpoch(
                json['created_at'].millisecondsSinceEpoch as int),
      );

  Map<String, dynamic> toJson() => {
        'destination': destination.toJson(),
        'amount_of_travelers': amountOfTraveler,
        'selected_seat': selectedSeats,
        'is_insurance': isInsurance,
        'is_refundable': isRefundable,
        'vat': vat,
        'price': price,
        'grand_total': grandTotal,
        'created_at': createdAt,
      };

  final String id;
  final DestinationModel destination;
  final int amountOfTraveler;
  final String selectedSeats;
  final bool isInsurance;
  final bool isRefundable;
  final double vat;
  final int price;
  final int grandTotal;
  DateTime? createdAt;

  @override
  List<Object?> get props => [
        destination,
        amountOfTraveler,
        selectedSeats,
        isInsurance,
        isRefundable,
        vat,
        price,
        grandTotal
      ];
}
