import 'package:flutter/material.dart';
import 'package:backdrop/ui/two_panels.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 200), value: 1.0);
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  bool get isPaneVisible {
    final AnimationStatus animationStatus = _animationController.status;
    return animationStatus == AnimationStatus.completed ||
        animationStatus == AnimationStatus.forward;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text("Backdrop"),
        centerTitle: true,
        leading: IconButton(
          icon: AnimatedIcon(
            icon: AnimatedIcons.close_menu,
            progress: _animationController.view,
          ),
          onPressed: () {
            _animationController.fling(velocity: isPaneVisible ? -1.0 : 1.0);
          },
        ),
      ),
      body: TwoPanels(animationController: _animationController,),
    );
  }
}
