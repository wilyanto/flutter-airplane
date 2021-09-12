import 'package:airplane/models/destination_model.dart';
import 'package:airplane/presentation/destination/destination_detail_page.dart';
import 'package:airplane/shared/theme.dart';
import 'package:flutter/material.dart';

class PopularDestinationCard extends StatelessWidget {
  const PopularDestinationCard({
    Key? key,
    required this.destinationModel,
  }) : super(key: key);

  final DestinationModel destinationModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          Navigator.pushNamed(context, DestinationDetailPage.routeName),
      child: Row(
        children: [
          Container(
            width: 200,
            height: 323,
            margin: EdgeInsets.only(left: defaultMargin),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(defaultRadius),
              color: kWhiteColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 180,
                  height: 220,
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(destinationModel.imageUrl),
                    ),
                    borderRadius: BorderRadius.circular(defaultRadius),
                  ),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 55,
                      height: 30,
                      decoration: BoxDecoration(
                        color: kWhiteColor,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(defaultRadius),
                        ),
                      ),
                      child: Row(
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
                            style: blackTextStyle.copyWith(
                              fontWeight: medium,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        destinationModel.name,
                        style: blackTextStyle.copyWith(
                          fontSize: 18,
                          fontWeight: medium,
                        ),
                      ),
                      Text(
                        destinationModel.city,
                        style: greyTextStyle.copyWith(
                          fontWeight: light,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
