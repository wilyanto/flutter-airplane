import 'package:airplane/models/destination_model.dart';
import 'package:equatable/equatable.dart';

class TransactionModel extends Equatable {
  const TransactionModel({
    required this.destination,
    this.amountOfTraveler = 0,
    this.selectedSeats = '',
    this.isInsurance = false,
    this.isRefundable = false,
    this.vat = 0,
    this.price = 0,
    this.grandTotal = 0,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      TransactionModel(
        destination: DestinationModel.fromJson(
            json['destination']['id'] as String,
            json['destination'] as Map<String, dynamic>),
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
      };

  final DestinationModel destination;
  final int amountOfTraveler;
  final String selectedSeats;
  final bool isInsurance;
  final bool isRefundable;
  final double vat;
  final int price;
  final int grandTotal;

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
