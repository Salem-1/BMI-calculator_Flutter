import 'package:flutter/material.dart';
import 'constants.dart';

class ReuseableCont extends StatelessWidget {
  ReuseableCont(
      {this.DoSomething, this.DoThis, this.colour = kAlwan, this.son});
  Function DoSomething;
  Function DoThis;
  Color colour;
  final Widget son;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: DoSomething,
      child: Container(
        child: son,
        margin: EdgeInsets.all(8),
        //height: h,
        //width: w,
        decoration: BoxDecoration(
            color: colour, borderRadius: BorderRadius.all(Radius.circular(20))),
      ),
    );
  }
}
