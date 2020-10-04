import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SliderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _Sliders(),
      ),
    );
  }
}

class _Sliders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: PageView(
      children: [
        _Slider('assets/svgs/1.svg'),
        _Slider('assets/svgs/2.svg'),
        _Slider('assets/svgs/3.svg'),
      ],
    ));
  }
}

class _Slider extends StatelessWidget {
  final String svg;

  _Slider(this.svg);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(30),
      child: SvgPicture.asset(svg),
    );
  }
}
