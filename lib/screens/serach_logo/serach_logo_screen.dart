import 'package:flutter/material.dart';
import 'package:subscription_tracker/config/constants.dart';
import 'package:subscription_tracker/config/palette.dart';
import 'package:subscription_tracker/widgets/widgets.dart';

class Logo {
  final String src;
  final String title;

  Logo({required this.src, required this.title});
}

final List<Logo> logos = [
  Logo(
    title: 'Netflix',
    src:
        'https://cdn.vox-cdn.com/thumbor/QuS2QKQys3HhosKiV-2IuKhphbo=/39x0:3111x2048/1400x1050/filters:focal(39x0:3111x2048):format(png)/cdn.vox-cdn.com/uploads/chorus_image/image/49901753/netflixlogo.0.0.png',
  ),
  Logo(
    title: 'Spotify',
    src:
        'https://outsideinmovement.com/wp-content/uploads/2017/09/download-5.jpeg',
  ),
  Logo(
    title: 'ivi',
    src: 'https://oppo.ru/wp-content/uploads/2018/12/ivi-logo.png',
  ),
];

class SearchLogoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      maxChildSize: 0.9,
      initialChildSize: 0.9,
      minChildSize: 0.6,
      builder: (_, controller) {
        return Container(
          decoration: const BoxDecoration(
            color: Palette.background,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(defaultBorderRadius),
              topLeft: Radius.circular(defaultBorderRadius),
            ),
          ),
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(
                top: defaultPadding,
                left: defaultPadding,
                right: defaultPadding),
            child: Column(
              children: [
                const Search(height: 50),
                Column(
                  children: logos
                      .map<_ItemLogo>((logo) => _ItemLogo(logo: logo))
                      .toList(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _ItemLogo extends StatelessWidget {
  final Logo logo;

  const _ItemLogo({Key? key, required this.logo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: defaultPadding),
      child: Row(
        children: [
          ImageSubscription(src: logo.src, size: 60),
          const SizedBox(width: 10),
          Text(
            logo.title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
