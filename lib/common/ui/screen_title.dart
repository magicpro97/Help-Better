import 'package:flutter/material.dart';

import '../dimens.dart';

class ScreenTitle extends StatelessWidget {
  const ScreenTitle({
    Key key,
    @required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final titleStyle = TextStyle(
      fontSize: Dimens.h1_size,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    );

    return Text(
      title,
      style: titleStyle,
      textAlign: TextAlign.center,
    );
  }
}
