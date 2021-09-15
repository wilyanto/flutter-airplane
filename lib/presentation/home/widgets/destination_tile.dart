import 'package:airplane/presentation/routers/routers.dart';
import 'package:airplane/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DestinationTile extends StatelessWidget {
  const DestinationTile({
    Key? key,
    required this.name,
    required this.city,
    required this.filename,
    this.rating = 0.0,
  }) : super(key: key);

  final String name;
  final String city;
  final String filename;
  final double rating;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.offAllNamed(Routers.destinationDetail),
      child: Container(
        margin: const EdgeInsets.only(top: 16),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(defaultRadius),
          color: kWhiteColor,
        ),
        child: Row(
          children: [
            Container(
              width: 70,
              height: 70,
              margin: const EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(defaultRadius),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/$filename.png'),
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: blackTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: medium,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    city,
                    style: greyTextStyle.copyWith(fontWeight: light),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 20,
                  height: 20,
                  margin: const EdgeInsets.only(right: 2),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/icon_star.png'),
                    ),
                  ),
                ),
                Text(
                  rating.toString(),
                  style: blackTextStyle.copyWith(
                    fontWeight: medium,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
