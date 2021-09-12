import 'package:airplane/shared/theme.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    required this.title,
    required this.hintText,
    this.isObscureText = false,
  }) : super(key: key);

  final String title;
  final String hintText;
  final bool isObscureText;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: blackTextStyle.copyWith(fontSize: 14),
          ),
          const SizedBox(
            height: 6,
          ),
          TextFormField(
            obscureText: isObscureText,
            cursorColor: kBlackColor,
            style: blackTextStyle.copyWith(fontSize: 16),
            decoration: InputDecoration(
              hintText: hintText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(defaultRadius),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  defaultRadius,
                ),
                borderSide: BorderSide(color: kPrimaryColor),
              ),
            ),
          )
        ],
      ),
    );
  }
}
