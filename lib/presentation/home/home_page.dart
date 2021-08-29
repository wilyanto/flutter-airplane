import 'package:airplane/presentation/home/widgets/popular_destination_card.dart';
import 'package:airplane/shared/theme.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  Widget header() => Container(
        margin: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
          top: 30,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello,\nWilyanto',
                    style: blackTextStyle.copyWith(
                      fontSize: 24,
                      fontWeight: semiBold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    'Where to fly today?',
                    style: greyTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: light,
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: 60,
              height: 60,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/image_profile.png'),
                ),
                shape: BoxShape.circle,
              ),
            )
          ],
        ),
      );

  Widget popularDestination() => Container(
        margin: const EdgeInsets.only(top: 30),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: const <Widget>[
              PopularDestinationCard(
                name: 'Lake Ciliwung',
                city: 'Tangerang',
                filename: 'image_destination1',
                rating: 4.8,
              ),
              PopularDestinationCard(
                name: 'White Houses',
                city: 'Spain',
                filename: 'image_destination2',
                rating: 4.7,
              ),
              PopularDestinationCard(
                name: 'Hill Heyo',
                city: 'Monaco',
                filename: 'image_destination3',
                rating: 4.8,
              ),
              PopularDestinationCard(
                name: 'Menarra',
                city: 'Japan',
                filename: 'image_destination4',
                rating: 5.0,
              ),
              PopularDestinationCard(
                name: 'Payung Teduh',
                city: 'Singapore',
                filename: 'image_destination5',
                rating: 4.8,
              ),
              SizedBox(width: 20),
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        header(),
        popularDestination(),
      ],
    );
  }
}
