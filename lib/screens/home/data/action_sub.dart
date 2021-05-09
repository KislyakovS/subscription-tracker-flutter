import 'package:subscription_tracker/models/subscription.dart';

final List<Subscription> actionSub = [
  Subscription(
    title: 'Apple Music',
    image:
        'https://pbs.twimg.com/profile_images/1310656963223584768/hr40_0pb_400x400.png',
    date: DateTime.utc(2021, DateTime.may, 20),
    price: 169,
    currency: '₽',
  ),
  Subscription(
    title: 'Megogo',
    image: 'https://androidshara.ru/wp-content/uploads/2018/10/Megogo.png',
    date: DateTime.utc(2021, DateTime.may, 30),
    price: 799,
    currency: '₽',
  ),
  Subscription(
    title: 'Tinder',
    image: 'https://tinder.com/static/tinder.png',
    date: DateTime.utc(2021, DateTime.may, 24),
    price: 9.99,
    currency: '\$',
  ),
  Subscription(
    title: '1Password',
    image:
        'https://www.macobserver.com/wp-content/uploads/2019/05/workfeatured-1Password.jpg',
    date: DateTime.utc(2021, DateTime.may, 13),
    price: 5.99,
    currency: '\$',
  ),
];
