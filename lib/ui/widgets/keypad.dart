import 'package:calculator/ui/widgets/button.dart';

import 'package:flutter/material.dart';


Widget buildKeypad(BuildContext context) {
  return Expanded(
    child: Column(
      children: <Widget>[
        Flexible(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildButton("C", context),
              buildButton("+/-", context),
              buildButton("%", context),
              buildButton("/", context),
            ],
          ),
        ),
        Flexible(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildButton("7", context),
              buildButton("8", context),
              buildButton("9", context),
              buildButton("*", context),
            ],
          ),
        ),
        Flexible(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildButton("4", context),
              buildButton("5", context),
              buildButton("6", context),
              buildButton("-", context),
            ],
          ),
        ),
        Flexible(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildButton("1", context),
              buildButton("2", context),
              buildButton("3", context),
              buildButton("+", context),
            ],
          ),
        ),
        Flexible(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildButton(".", context),
              buildButton("0", context),
              buildButton("<=", context),
              buildButton("=", context),
            ],
          ),
        ),
      ],
    ),
  );
}