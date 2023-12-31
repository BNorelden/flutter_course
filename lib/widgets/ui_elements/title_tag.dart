import 'package:flutter/material.dart';

class TitleTag extends StatelessWidget {
  final String title;

  const TitleTag(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 26.0,
        fontWeight: FontWeight.bold,
        fontFamily: 'Oswald',
      ),
    );
  }
}
