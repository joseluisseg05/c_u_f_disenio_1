import 'package:app_disenios_custom/src/widgets/header_cua_wdg.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //body: HeaderCuadrado(),
      body: HeaderBorderRen(),
    );
  }
}
