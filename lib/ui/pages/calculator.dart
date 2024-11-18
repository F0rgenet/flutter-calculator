import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:calculator/ui/widgets/keypad.dart';
import '../../../../bloc/calculator_bloc.dart';


class Calculator extends StatelessWidget {
  const Calculator({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculator"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: BlocConsumer<CalculatorBloc, CalculatorState>(
          listener: (context, state) {
            if (state is CalculatorError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.error),
                  backgroundColor: Theme.of(context).colorScheme.error,
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is CalculatorInitial || state is CalculatorError) {
              return Column(
                children: [
                  _ExpressionDisplay(expression: state.expression),
                  _ResultDisplay(result: ""),
                  const Divider(thickness: 1),
                  buildKeypad(context),
                ],
              );
            }
            if (state is CalculatorResult) {
              return Column(
                children: [
                  _ExpressionDisplay(expression: state.expression),
                  _ResultDisplay(result: state.result),
                  const Divider(thickness: 1),
                  buildKeypad(context),
                ],
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}

class _ExpressionDisplay extends StatelessWidget {
  final String expression;

  const _ExpressionDisplay({
    required this.expression,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 120),
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 16,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        reverse: true,
        child: Text(
          expression.isEmpty ? '0' : expression,
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class _ResultDisplay extends StatelessWidget {
  final String result;

  const _ResultDisplay({
    required this.result,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 80),
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 16,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        reverse: true,
        child: Text(
          result.isEmpty ? '0' : result,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ),
    );
  }
}