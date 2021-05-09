import 'package:subscription_tracker/models/subscription.dart';

final List<Subscription> pausedSub = [
  Subscription(
    title: 'Яндекс Музыка',
    image:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT9NddzyZgny4ApMC20AJo1gX9zyLNWPEXYERleYmDtTmmeHSPh3flTMm-ahAaNEXnBttA&usqp=CAU',
    date: DateTime.utc(2021, DateTime.may, 26),
    price: 169,
    currency: '₽',
  ),
  Subscription(
    title: 'Кинопоиск',
    image:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgBuOaEVJe96CjoJChpUT32XnbqbEogBAx7jL3T-rVBCdqHZo1OnIsp18igd_HiiAQYJ4&usqp=CAU',
    date: DateTime.utc(2021, DateTime.may, 21),
    price: 199,
    currency: '₽',
  ),
];
