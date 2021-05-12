import 'package:intl/intl.dart';

class Subscription {
  final String title;
  final String image;
  final DateTime date;
  final double price;
  final String currency;

  String fullPrice() {
    final formatedPrice = price.remainder(1) == 0 ? price.floor() : price;

    return '$currency $formatedPrice';
  }

  String getDate() {
    final formatter = DateFormat('d MMMM');

    return formatter.format(date);
  }

  int remained() {
    return date.day - DateTime.now().day;
  }

  Subscription({
    required this.title,
    required this.image,
    required this.date,
    required this.price,
    required this.currency,
  });
}
