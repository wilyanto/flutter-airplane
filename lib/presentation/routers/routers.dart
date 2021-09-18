import 'package:airplane/models/destination_model.dart';
import 'package:airplane/presentation/auth/sign_in/sign_in_page.dart';
import 'package:airplane/presentation/auth/sign_up/sign_up_page.dart';
import 'package:airplane/presentation/bonus/bonus_page.dart';
import 'package:airplane/presentation/booking/select_seat_page.dart';
import 'package:airplane/presentation/checkout/checkout_page.dart';
import 'package:airplane/presentation/checkout/success/sucess_checkout_page.dart';
import 'package:airplane/presentation/destination/destination_detail_page.dart';
import 'package:airplane/presentation/get_started/get_started.dart';
import 'package:airplane/presentation/main/main_page.dart';
import 'package:airplane/presentation/splash/splash_page.dart';
import 'package:get/get.dart';

class Routers {
  static const String splash = '/';
  static const String getStarted = '/get-started';
  static const String signIn = '/sign-in';
  static const String signUp = '/sign-up';
  static const String bonus = '/bonus';

  static const String main = '/main';

  static const String destinationDetail = '/destination-detail';
  static const String selectSeat = '/select-seat';

  static const String checkout = '/checkout';
  static const String checkoutSuccess = '/checkout-success';

  final List<GetPage> routers = [
    GetPage(
      name: Routers.splash,
      page: () => SplashPage(),
    ),
    GetPage(
      name: Routers.getStarted,
      page: () => GetStartedPage(),
    ),
    GetPage(
      name: Routers.signIn,
      page: () => SignInPage(),
    ),
    GetPage(
      name: Routers.signUp,
      page: () => SignUpPage(),
    ),
    GetPage(
      name: Routers.bonus,
      page: () => BonusPage(),
    ),
    GetPage(
      name: Routers.main,
      page: () => MainPage(),
    ),
    GetPage(
      name: Routers.destinationDetail,
      page: () => DestinationDetailPage(
        destinationModel: Get.arguments as DestinationModel,
      ),
    ),
    GetPage(
      name: Routers.selectSeat,
      page: () => SelectSeatPage(
        destination: Get.arguments as DestinationModel,
      ),
    ),
    GetPage(
      name: Routers.checkout,
      page: () => CheckoutPage(),
    ),
    GetPage(
      name: Routers.checkoutSuccess,
      page: () => SuccessCheckoutPage(),
    ),
  ];
}
