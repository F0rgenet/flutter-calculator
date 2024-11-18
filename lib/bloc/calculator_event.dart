part of 'calculator_bloc.dart';

abstract class CalculatorEvent {}

class UpdateExpression extends CalculatorEvent {
  final String value;

  UpdateExpression(this.value);
}

class DeleteLastSymbol extends CalculatorEvent {}

class ClearExpression extends CalculatorEvent {}

class CalculateResult extends CalculatorEvent {}