import 'package:flutter/material.dart';

class TwoPanels extends StatefulWidget {
  final AnimationController animationController;

  TwoPanels({this.animationController});

  @override
  _TwoPanelsState createState() => _TwoPanelsState();
}

class _TwoPanelsState extends State<TwoPanels> {
  static const header_height = 32.0;

  Animation<RelativeRect> getPanelAnimation(BoxConstraints constraints) {
    final height = constraints.biggest.height;
    final backPanelHieght = height - header_height;
    final frontPanelHeight = -header_height;

    return new RelativeRectTween(
            begin: RelativeRect.fromLTRB(
                0.0, backPanelHieght, 0.0, frontPanelHeight),
            end: RelativeRect.fromLTRB(0.0, 0.0, 0.0, 0.0))
        .animate(CurvedAnimation(
            parent: widget.animationController, curve: Curves.linear));
  }

  Widget getPanels(BuildContext context, BoxConstraints constraints) {
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            color: Theme.of(context).primaryColor,
            child: Center(
                child: Text(
              "Hello from \nthe Backdrop",
              style: TextStyle(color: Colors.white, fontSize: 32.0),
              textAlign: TextAlign.center,
            )),
          ),
          new PositionedTransition(
            rect: getPanelAnimation(constraints),
            child: Material(
              elevation: 12.0,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0)),
              child: Column(
                children: <Widget>[
                  Container(
                    height: header_height,
                    child: Center(
                      child: Text("Stop here"),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text("Front panel"),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: getPanels,
    );
  }
}
