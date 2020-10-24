import 'package:flutter/material.dart';

class SliderListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //body: _Titulo(),
        body: Stack(
      children: [
        _MainStroll(),
        Positioned(
          bottom: -10,
          right: 0,
          child: _ButtonNewList(),
        ),
      ],
    ));
  }
}

class _ButtonNewList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ButtonTheme(
      minWidth: size.width * 0.8,
      height: size.height * 0.12,
      child: RaisedButton(
        color: Color(0xffED6762),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(50.0)),
        ),
        child: Text(
          'CREATE NEW LIST',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 3.0,
          ),
        ),
        onPressed: () {},
      ),
    );
  }
}

class _MainStroll extends StatelessWidget {
  final items = [
    _ListItem('Orange', Color(0xffF08F66)),
    _ListItem('Family', Color(0xffF2A38A)),
    _ListItem('Subscriptions', Color(0xffF7CDD5)),
    _ListItem('Books', Color(0xffFCEBAF)),
    _ListItem('Orange', Color(0xffF08F66)),
    _ListItem('Family', Color(0xffF2A38A)),
    _ListItem('Subscriptions', Color(0xffF7CDD5)),
    _ListItem('Books', Color(0xffFCEBAF)),
  ];
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        /*
        SliverAppBar(
          floating: true,
          title: Text('Hola'),
          backgroundColor: Colors.teal,
        ),*/
        SliverPersistentHeader(
          floating: true,
          delegate: _SliverCustomHeaderDelegate(
            minheaight: 170.0,
            maxheaight: 200.0,
            child: Container(
              alignment: Alignment.centerLeft,
              color: Colors.white,
              child: _Titulo(),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            ...items,
            SizedBox(height: 100.0),
          ]),
        ),
      ],
    );
  }
}

class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minheaight;
  final double maxheaight;
  final Widget child;

  _SliverCustomHeaderDelegate({
    @required this.minheaight,
    @required this.maxheaight,
    @required this.child,
  });
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  double get maxExtent => maxheaight;

  @override
  double get minExtent => minheaight;

  @override
  bool shouldRebuild(_SliverCustomHeaderDelegate oldDelegate) {
    return maxheaight != oldDelegate.maxheaight ||
        minheaight != oldDelegate.minheaight ||
        child != oldDelegate.child;
  }
}

class _Titulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 30.0),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
          child: Text(
            'New',
            style: TextStyle(
              color: Color(0xff532128),
              fontSize: 50.0,
            ),
          ),
        ),
        Stack(
          children: [
            SizedBox(width: 100.0),
            Positioned(
              bottom: 8.0,
              child: Container(
                width: 140,
                height: 8,
                color: Color(0xffF7CDD5),
              ),
            ),
            Container(
              child: Text(
                'List',
                style: TextStyle(
                  color: Color(0xffD93A30),
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}

class _ListaTareas extends StatelessWidget {
  final items = [
    _ListItem('Orange', Color(0xffF08F66)),
    _ListItem('Family', Color(0xffF2A38A)),
    _ListItem('Subscriptions', Color(0xffF7CDD5)),
    _ListItem('Books', Color(0xffFCEBAF)),
    _ListItem('Orange', Color(0xffF08F66)),
    _ListItem('Family', Color(0xffF2A38A)),
    _ListItem('Subscriptions', Color(0xffF7CDD5)),
    _ListItem('Books', Color(0xffFCEBAF)),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) => items[index],
    );
  }
}

class _ListItem extends StatelessWidget {
  final String titlulo;
  final Color color;

  _ListItem(this.titlulo, this.color);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      height: 130,
      padding: EdgeInsets.all(30.0),
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Text(
        titlulo,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20.0,
        ),
      ),
    );
  }
}
