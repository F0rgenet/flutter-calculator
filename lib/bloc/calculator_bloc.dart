import 'package:bloc/bloc.dart';

import 'package:calculator/core/utils/evaluator.dart';

import '../core/models/token.dart';
import '../core/utils/tokenizer.dart';

part 'calculator_event.dart';
part 'calculator_state.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  CalculatorBloc() : super(const CalculatorInitial()) {
    on<UpdateExpression>((event, emit) async {
      final tokenizer = Tokenizer();

      final currentExpression = state.expression + event.value;
      final evaluator = Evaluator();

      try {
        final result = evaluator.evaluate(currentExpression);
        emit(CalculatorResult(currentExpression, result.toString()));
      } catch (e) {
        emit(CalculatorError(currentExpression, e.toString()));
      }
    });

    on<DeleteLastSymbol>((event, emit) async {
      if (state.expression.isEmpty) return;

      final currentExpression = state.expression.substring(0, state.expression.length - 1);
      if (currentExpression.isEmpty) {
        emit(const CalculatorInitial());
        return;
      }

      try {
        final evaluator = Evaluator();
        final result = evaluator.evaluate(currentExpression);
        emit(CalculatorResult(currentExpression, result.toString()));
      } catch (e) {
        emit(CalculatorResult(currentExpression, ''));
      }
    });

    on<ClearExpression>((event, emit) async {
      emit(const CalculatorInitial());
    });

    on<CalculateResult>((event, emit) async {
      print(state.expression);
      try {
        final evaluator = Evaluator();
        final result = evaluator.evaluate(state.expression);
        emit(CalculatorResult(state.expression, result.toString()));
      } catch (e) {
        emit(CalculatorError(state.expression, e.toString()));
      }
    });
  }
}