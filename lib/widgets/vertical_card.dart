import 'package:flutter/material.dart';

class VerticalCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                'https://cdn.vox-cdn.com/thumbor/QuS2QKQys3HhosKiV-2IuKhphbo=/39x0:3111x2048/1400x1050/filters:focal(39x0:3111x2048):format(png)/cdn.vox-cdn.com/uploads/chorus_image/image/49901753/netflixlogo.0.0.png',
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Netflix',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Text(
                  '\$12.99/Month',
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                )
              ],
            )
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
          decoration: BoxDecoration(
              color: Colors.purple[100],
              borderRadius: BorderRadius.circular(10)),
          child: Text(
            '23 May',
            style: TextStyle(
                color: Colors.deepPurple, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
