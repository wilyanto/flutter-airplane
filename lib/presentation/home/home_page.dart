import 'package:airplane/presentation/home/widgets/destination_tile.dart';
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

  Widget newDestination() => Container(
        margin: EdgeInsets.only(
          top: 30,
          left: defaultMargin,
          right: defaultMargin,
          bottom: 100,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'New This Year',
              style: blackTextStyle.copyWith(
                fontSize: 18,
                fontWeight: semiBold,
              ),
            ),
            const DestinationTile(
              name: 'Danau Beratan',
              city: 'Singajara',
              filename: 'image_destination6',
              rating: 4.5,
            ),
            const DestinationTile(
              name: 'Sydney Opera',
              city: 'Australlia',
              filename: 'image_destination7',
              rating: 4.7,
            ),
            const DestinationTile(
              name: 'Roma',
              city: 'Italy',
              filename: 'image_destination8',
              rating: 4.8,
            ),
            const DestinationTile(
              name: 'Payung Teduh',
              city: 'Singapore',
              filename: 'image_destination9',
              rating: 4.5,
            ),
            const DestinationTile(
              name: 'Hill Hey',
              city: 'Monaco',
              filename: 'image_destination10',
              rating: 4.7,
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        header(),
        popularDestination(),
        newDestination(),
      ],
    );
  }
}
