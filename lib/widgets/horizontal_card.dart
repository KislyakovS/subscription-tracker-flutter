import 'package:flutter/material.dart';

class HorizontalCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      width: 150,
      height: 130,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  'https://cdn.vox-cdn.com/thumbor/QuS2QKQys3HhosKiV-2IuKhphbo=/39x0:3111x2048/1400x1050/filters:focal(39x0:3111x2048):format(png)/cdn.vox-cdn.com/uploads/chorus_image/image/49901753/netflixlogo.0.0.png',
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Flexible(
                child: Column(
                  children: [
                    Text(
                      '\$ 12.99',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Monthly',
                      style: TextStyle(fontSize: 14, color: Colors.grey[400]),
                    )
                  ],
                ),
              )
            ],
          ),
          Text('Netflix Standart',
              style: TextStyle(fontWeight: FontWeight.bold)),
          Row(
            children: [
              Stack(
                children: [
                  CircularProgressIndicator(
                    value: 0.9,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.purple),
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text('6'),
                    ),
                  )
                ],
              ),
              const SizedBox(
                width: 12,
              ),
              Text('Days \nRemain')
            ],
          ),
        ],
      ),
    );
  }
}
