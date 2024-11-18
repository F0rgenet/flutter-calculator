part of 'calculator_bloc.dart';

abstract class CalculatorState {
  final String expression;

  const CalculatorState(this.expression);

  List<Object> get props => [expression];
}

class CalculatorInitial extends CalculatorState {
  const CalculatorInitial() : super('');
}

class CalculatorResult extends CalculatorState {
  final String result;

  const CalculatorResult(super.expression, this.result);

  @override
  List<Object> get props => [expression, result];
}

class CalculatorError extends CalculatorState {
  final String error;

  const CalculatorError(super.expression, this.error);

  @override
  List<Object> get props => [expression, error];
}