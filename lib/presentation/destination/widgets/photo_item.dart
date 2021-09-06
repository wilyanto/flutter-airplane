import 'package:airplane/shared/theme.dart';
import 'package:flutter/material.dart';

class PhotoItem extends StatelessWidget {
  const PhotoItem({
    Key? key,
    required this.filename,
  }) : super(key: key);
  
  final String filename;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/$filename.png'),
        ),
        borderRadius: BorderRadius.circular(defaultRadius),
      ),
    );
  }
}
