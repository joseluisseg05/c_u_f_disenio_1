import 'package:flutter/material.dart';

class HeaderCuadrado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      color: Colors.teal,
    );
  }
}

class HeaderBorderRen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      decoration: BoxDecoration(
        color: Colors.teal,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(90)),
      ),
    );
  }
}
