import 'package:airplane/models/destination_model.dart';
import 'package:airplane/presentation/core/widgets/cta_button.dart';
import 'package:airplane/presentation/destination/widgets/interest_item.dart';
import 'package:airplane/presentation/destination/widgets/photo_item.dart';
import 'package:airplane/presentation/routers/routers.dart';
import 'package:airplane/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DestinationDetailPage extends StatelessWidget {
  const DestinationDetailPage({
    Key? key,
    required this.destinationModel,
  }) : super(key: key);

  final DestinationModel destinationModel;

  @override
  Widget build(BuildContext context) {
    Widget backgroundImage() => Container(
          width: double.infinity,
          height: 450,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(destinationModel.imageUrl),
            ),
          ),
        );

    Widget customShadow() => Container(
          width: double.infinity,
          height: 214,
          margin: const EdgeInsets.only(top: 236),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                kWhiteColor.withOpacity(0),
                Colors.black.withOpacity(0.95)
              ])),
        );

    Widget content() => Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(
            horizontal: defaultMargin,
          ),
          child: Column(
            children: [
              // NOTE: EMBLEM
              Container(
                width: 108,
                height: 24,
                margin: const EdgeInsets.only(top: 30),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/icon_emblem.png'),
                  ),
                ),
              ),

              // NOTE: TITLE
              Container(
                margin: const EdgeInsets.only(
                  top: 256,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            destinationModel.name,
                            style: whiteTextStyle.copyWith(
                              fontSize: 24,
                              fontWeight: semiBold,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            destinationModel.city,
                            style: whiteTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: light,
                            ),
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
                          destinationModel.rating.toString(),
                          style: whiteTextStyle.copyWith(
                            fontWeight: medium,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),

              // NOTE: DESCRIPTION
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 30),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 30,
                ),
                decoration: BoxDecoration(
                  color: kWhiteColor,
                  borderRadius: BorderRadius.circular(defaultRadius),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // NOTE: ABOUT
                    Text(
                      'About',
                      style: blackTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: semiBold,
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      // ignore: lines_longer_than_80_chars
                      'Berada di jalur jalan provinsi yang menghubungkan Denpasar Singaraja serta letaknya yang dekat dengan Kebun Raya Eka Karya menjadikan tempat Bali.',
                      style: blackTextStyle.copyWith(
                        height: 2.0,
                      ),
                    ),

                    // NOTE: PHOTOS
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Photos',
                      style: blackTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: semiBold,
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Row(
                      children: const [
                        PhotoItem(
                          filename: 'image_photo1',
                        ),
                        PhotoItem(
                          filename: 'image_photo2',
                        ),
                        PhotoItem(
                          filename: 'image_photo3',
                        ),
                      ],
                    ),

                    // NOTE: INTERESTS
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Interests',
                      style: blackTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: semiBold,
                      ),
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                    Row(
                      children: const [
                        InterestItem(
                          interest: 'Kids park',
                        ),
                        InterestItem(
                          interest: 'Honor Bridge',
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: const [
                        InterestItem(
                          interest: 'City Museum',
                        ),
                        InterestItem(
                          interest: 'Central Mall',
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // NOTE: PRICE AND BOOK
              Container(
                margin: const EdgeInsets.symmetric(vertical: 30),
                width: double.infinity,
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            NumberFormat.currency(
                              locale: 'id',
                              symbol: 'IDR ',
                              decimalDigits: 0,
                            ).format(destinationModel.price),
                            // 'IDR ${destinationModel.price}',
                            style: blackTextStyle.copyWith(
                              fontSize: 18,
                              fontWeight: medium,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'per orang',
                            style: greyTextStyle.copyWith(
                              fontWeight: light,
                            ),
                          )
                        ],
                      ),
                    ),

                    // NOTE: BOOK BUTTON
                    CtaButton(
                      title: 'Book Now',
                      onPressed: () {
                        Get.toNamed(Routers.selectSeat);
                      },
                      width: 170,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            backgroundImage(),
            customShadow(),
            content(),
          ],
        ),
      ),
    );
  }
}
