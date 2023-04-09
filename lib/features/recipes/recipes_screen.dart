import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:recipes/lib.dart';

class RecipesScreen extends StatelessWidget {
  const RecipesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Recipes",
                style: titleExtraLargeBold,
              ),
              sizedHeight8,
              Container(
                height: 45,
                decoration: BoxDecoration(
                    color: secondayColor,
                    borderRadius: radius,
                    border: Border.all(width: 1)),
              ),
              sizedHeight16,
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    for (final recipe in recipes)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: Container(
                          height: 336,
                          decoration: BoxDecoration(
                            color: secondayColor,
                            borderRadius: radius,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 1,
                                blurStyle: BlurStyle.inner,
                                offset: const Offset(
                                    0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: radius,
                                child: AspectRatio(
                                  aspectRatio: 16 / 9,
                                  child: Image.network(
                                    recipe.imageUrl,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      recipe.name,
                                      style: buttomButton,
                                    ),
                                    Wrap(spacing: 8, children: [
                                      for (final topic in recipe.topics)
                                        Chip(
                                          label: Text(topic),
                                          backgroundColor: primaryWithOpacity,
                                        )
                                    ]),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        RatingBar(
                                          initialRating: 3,
                                          itemSize: 20,
                                          glow: false,
                                          direction: Axis.horizontal,
                                          allowHalfRating: false,
                                          itemCount: 5,
                                          ratingWidget: RatingWidget(
                                            full: Image.asset(
                                                'assets/images/star.png'),
                                            half: Image.asset(
                                                'assets/images/star.png'),
                                            empty: Image.asset(
                                                'assets/images/empty_star.png'),
                                          ),
                                          itemPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 4.0),
                                          onRatingUpdate: (rating) {
                                            print(rating);
                                          },
                                        ),
                                        const Icon(
                                          Icons.favorite,
                                          color: darkPrimary,
                                          size: 36,
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

final recipes = [
  Recipe(
    name: "Pancake With Raspberry",
    rating: 100,
    imageUrl:
        "https://img.buzzfeed.com/thumbnailer-prod-us-east-1/video-api/assets/360219.jpg",
    isFavourite: false,
    topics: ["Breakfast", "Community Recipe"],
  ),
  Recipe(
    name: "Griddle Stackers",
    rating: 100,
    imageUrl:
        "https://img.buzzfeed.com/thumbnailer-prod-us-east-1/video-api/assets/360217.jpg",
    isFavourite: false,
    topics: ["Launch", "Vitamens", "Healthy"],
  ),
  Recipe(
    name: "Oroe Chocolate Chips",
    rating: 75,
    imageUrl:
        "https://img.buzzfeed.com/thumbnailer-prod-us-east-1/video-api/assets/360213.jpg",
    isFavourite: true,
    topics: ["Sweet", "Almonds", "Fast"],
  ),
];
