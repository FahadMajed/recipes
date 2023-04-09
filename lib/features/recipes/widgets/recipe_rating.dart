import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RecipeRating extends StatelessWidget {
  const RecipeRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RatingBar(
      initialRating: 3,
      itemSize: 20,
      glow: false,
      direction: Axis.horizontal,
      allowHalfRating: false,
      itemCount: 5,
      ratingWidget: RatingWidget(
        full: Image.asset('assets/images/star.png'),
        half: Image.asset('assets/images/star.png'),
        empty: Image.asset('assets/images/empty_star.png'),
      ),
      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
      onRatingUpdate: (rating) {},
    );
  }
}
