import 'package:airplane/shared/theme.dart';
import 'package:flutter/material.dart';

class TacButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 35, bottom: defaultMargin),
      child: Text(
        'Terms and Conditions',
        style: greenTextStyle.copyWith(
          fontSize: 16,
          fontWeight: light,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
