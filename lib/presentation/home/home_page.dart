import 'package:airplane/cubit/auth/auth_cubit.dart';
import 'package:airplane/cubit/destination/destination_cubit.dart';
import 'package:airplane/models/destination_model.dart';
import 'package:airplane/presentation/core/widgets/snack_bar.dart';
import 'package:airplane/presentation/home/widgets/destination_tile.dart';
import 'package:airplane/presentation/home/widgets/popular_destination_card.dart';
import 'package:airplane/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HomePage extends HookWidget {
  const HomePage({Key? key}) : super(key: key);

  Widget header() {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is AuthSuccess) {
          return Container(
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
                        'Hello,\n${state.user.name}',
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
        } else {
          return const SizedBox();
        }
      },
    );
  }

  Widget popularDestination(List<DestinationModel> destinations) {
    final List<Widget> listRow = [];
    listRow.addAll(destinations
        .map(
            (DestinationModel e) => PopularDestinationCard(destinationModel: e))
        .toList());
    listRow.add(const SizedBox(width: 20));

    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(children: listRow),
      ),
    );
  }

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
    useEffect(() {
      context.read<DestinationCubit>().fetchDestinations();
    });

    return BlocConsumer<DestinationCubit, DestinationState>(
      listener: (context, state) {
        if (state is DestinationFailed) {
          CustomSnackBar().show(descrption: state.error);
        }
      },
      builder: (context, state) {
        if (state is DestinationSuccess) {
          return ListView(
            children: [
              header(),
              popularDestination(state.destinations),
              newDestination(),
            ],
          );
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
