// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class LocationTag extends StatelessWidget {
  final String location;

  LocationTag(this.location);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 1.0),
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: Text(location, style: TextStyle(/* color: Colors.white */)),
    );
  }
}
