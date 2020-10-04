import 'package:app_disenios_custom/src/models/slider_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:provider/provider.dart';

class SliderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SliderModel(),
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              Expanded(
                child: _Sliders(),
              ),
              _Dots(),
            ],
          ),
        ),
      ),
    );
  }
}

class _Dots extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _Dot(0),
          _Dot(1),
          _Dot(2),
        ],
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;

  _Dot(this.index);

  @override
  Widget build(BuildContext context) {
    final pageIndex = Provider.of<SliderModel>(context).curretPage;
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      width: 12.0,
      height: 12.0,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: (pageIndex >= index - 0.5 && pageIndex < index + 0.5)
            ? Colors.teal
            : Colors.grey,
        shape: BoxShape.circle,
      ),
    );
  }
}

class _Sliders extends StatefulWidget {
  @override
  __SlidersState createState() => __SlidersState();
}

class __SlidersState extends State<_Sliders> {
  final pageVcontroller = PageController();

  @override
  void initState() {
    super.initState();
    pageVcontroller.addListener(() {
      //print('pagina ${pageVcontroller.page}');
      //actualizar el provider
      Provider.of<SliderModel>(context, listen: false).curretPage =
          pageVcontroller.page;
    });
  }

  @override
  void dispose() {
    pageVcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: PageView(
      controller: pageVcontroller,
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
