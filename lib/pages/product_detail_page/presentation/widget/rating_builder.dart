import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingBuilder extends StatelessWidget {
  final double rate;
  final double? itemsize;

  const RatingBuilder({super.key, required this.rate, this.itemsize});

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: rate,
      itemSize: itemsize ?? 20,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      ignoreGestures: true,
      itemPadding: const EdgeInsets.only(left: 4),
      itemBuilder: (context, _) => Icon(
        Icons.star,
        color: Colors.amber[300],
      ),
      onRatingUpdate: (rating) {
        print(rating);
      },
    );
  }
}
