import 'package:flutter/material.dart';
import 'package:movie_setup_app/Colors.dart';

class backButton extends StatelessWidget {
  const backButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 70,
      margin: const EdgeInsets.only(top: 16, left: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colours.scaffoldBgColor,
      ),
      child: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back_rounded),
      ),
    );
  }
}
