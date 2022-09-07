import 'package:flutter/material.dart';
import 'constants.dart';

class Gender extends StatelessWidget {
  Gender({@required this.icona, @required this.text});
  IconData icona;
  String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icona,
          size: kIconSize,
        ),
        SizedBox(
          height: kSizedHeight,
        ),
        Text(text, style: kZeena),
      ],
    );
  }
}
