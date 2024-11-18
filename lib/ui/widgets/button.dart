import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/calculator_bloc.dart';

void _handleButtonPress(BuildContext context, String value) {
  final bloc = context.read<CalculatorBloc>();

  switch (value) {
    case 'C':
      bloc.add(ClearExpression());
      break;
    case '=':
      bloc.add(CalculateResult());
      break;
    case '<=':
      bloc.add(DeleteLastSymbol());
      break;
    case '+/-':
      // TODO: implement
      break;
    default:
      bloc.add(UpdateExpression(value));
  }
}



Widget buildButton(String buttonText, BuildContext context) {
  void onPressed() {
    _handleButtonPress(context, buttonText);
  }
  return Expanded(
    child: Container(
      margin: const EdgeInsets.all(10),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          textStyle: const TextStyle(fontSize: 25),
        ),
        child: Text(buttonText),
      ),
    ),
  );
}