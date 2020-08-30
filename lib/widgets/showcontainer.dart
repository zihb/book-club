import 'package:flutter/material.dart';


class ShowContainer extends StatelessWidget {
  final Widget child;

  const ShowContainer({Key key ,this.child}): super(key:key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
      color: Colors.lightBlue[100],
      borderRadius: BorderRadius.circular(20.0),
      ),
      child: child,
    );
  }
}