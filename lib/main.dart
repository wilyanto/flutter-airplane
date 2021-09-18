import 'package:airplane/cubit/auth/auth_cubit.dart';
import 'package:airplane/cubit/bottom_navigation/page_cubit.dart';
import 'package:airplane/cubit/destination/destination_cubit.dart';
import 'package:airplane/cubit/seat/seat_cubit.dart';
import 'package:airplane/cubit/transaction/transaction_cubit.dart';
import 'package:airplane/presentation/routers/routers.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => PageCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => AuthCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => DestinationCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => SeatCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => TransactionCubit(),
        ),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        getPages: Routers().routers,
        initialRoute: Routers.splash,
      ),
    );
  }
}
