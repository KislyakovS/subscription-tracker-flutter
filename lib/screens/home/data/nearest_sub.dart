import 'package:subscription_tracker/models/subscription.dart';

final List<Subscription> nearestSubs = [
  Subscription(
    title: 'Netflix',
    image:
        'https://cdn.vox-cdn.com/thumbor/QuS2QKQys3HhosKiV-2IuKhphbo=/39x0:3111x2048/1400x1050/filters:focal(39x0:3111x2048):format(png)/cdn.vox-cdn.com/uploads/chorus_image/image/49901753/netflixlogo.0.0.png',
    date: DateTime.utc(2021, DateTime.may, 18),
    price: 12.99,
    currency: '\$',
  ),
  Subscription(
    title: 'Spotify',
    image:
        'https://outsideinmovement.com/wp-content/uploads/2017/09/download-5.jpeg',
    date: DateTime.utc(2021, DateTime.may, 14),
    price: 169,
    currency: '₽',
  ),
  Subscription(
    title: 'ivi',
    image: 'https://oppo.ru/wp-content/uploads/2018/12/ivi-logo.png',
    date: DateTime.utc(2021, DateTime.may, 15),
    price: 699,
    currency: '₽',
  ),
];
