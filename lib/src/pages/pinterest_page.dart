import 'package:app_disenios_custom/src/widgets/pinterest_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class PinterestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _MenuModel(),
      child: Scaffold(
        //body: PinterestMenu(), //PinterestWdg(),
        body: Stack(
          children: [
            PinterestWdg(),
            _MenuLocation(),
          ],
        ),
      ),
    );
  }
}

class _MenuLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final mostrar = Provider.of<_MenuModel>(context).mostrar;
    return Positioned(
      bottom: 30.0,
      child: Container(
        width: width,
        child: Align(
          child: PinterestMenu(
            mostrar: mostrar,
            //backgroundColor: Colors.red,
            //activeColor: Colors.amber,
            //inactiveColor: Colors.blue,
            items: [
              PinterestButton(
                icon: Icons.pie_chart,
                onPressed: () {
                  print('pie_chrt');
                },
              ),
              PinterestButton(
                icon: Icons.search,
                onPressed: () {
                  print('search');
                },
              ),
              PinterestButton(
                icon: Icons.notifications,
                onPressed: () {
                  print('notifications');
                },
              ),
              PinterestButton(
                icon: Icons.supervised_user_circle,
                onPressed: () {
                  print('supervised_user_circle');
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PinterestWdg extends StatefulWidget {
  @override
  _PinterestWdgState createState() => _PinterestWdgState();
}

class _PinterestWdgState extends State<PinterestWdg> {
  final List item = List.generate(200, (index) => index);
  ScrollController controller = ScrollController();
  double scrollAnt = 0;

  @override
  void initState() {
    controller.addListener(() {
      //print('Scroll ${controller.offset}');
      if (controller.offset > scrollAnt && controller.offset > 150) {
        //print('Ocultar');
        Provider.of<_MenuModel>(context, listen: false).mostrar = false;
      } else {
        //print('Mostrar');
        Provider.of<_MenuModel>(context, listen: false).mostrar = true;
      }
      scrollAnt = controller.offset;
    });

    @override
    void dispose() {
      controller.dispose();
      super.dispose();
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      controller: controller,
      crossAxisCount: 4,
      itemCount: item.length,
      itemBuilder: (BuildContext context, int index) => _PinteresrtItem(index),
      staggeredTileBuilder: (int index) =>
          StaggeredTile.count(2, index.isEven ? 2 : 3),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }
}

class _PinteresrtItem extends StatelessWidget {
  final int index;

  _PinteresrtItem(this.index);
  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: Colors.teal,
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
      ),
      child: new Center(
        child: new CircleAvatar(
          backgroundColor: Colors.white,
          child: new Text('$index'),
        ),
      ),
    );
  }
}

class _MenuModel with ChangeNotifier {
  bool _mostrar = true;

  bool get mostrar => this._mostrar;
  set mostrar(bool valor) {
    this._mostrar = valor;
    notifyListeners();
  }
}
