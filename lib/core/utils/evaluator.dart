import 'dart:collection';
import 'dart:math';

import 'package:calculator/core/utils/tokenizer.dart';
import 'package:calculator/core/utils/parser.dart';

import '../models/stack.dart';
import '../models/token.dart';

class Evaluator {
  num evaluate(String expression) {
    final tokenizer = Tokenizer();
    final infixExpression = tokenizer.tokenize(expression);
    final infixExpressionQueue = Queue<Token>.from(infixExpression);
    final parser = Parser();
    final postfixExpression = parser.getPostfixExpression(infixExpressionQueue);
    return evaluatePostfixExpression(postfixExpression);
  }

  num evaluatePostfixExpression(List<Token> postfixExpression) {
    final stack = Stack<num>();
    for (final token in postfixExpression) {
      if (token.type == TokenType.number) {
        stack.push(num.parse(token.literal));
      } else if (token.type == TokenType.plus) {
        final right = stack.pop();
        final left = stack.pop();
        stack.push(left + right);
      } else if (token.type == TokenType.minus) {
        final right = stack.pop();
        final left = stack.pop();
        stack.push(left - right);
      } else if (token.type == TokenType.multiply) {
        final right = stack.pop();
        final left = stack.pop();
        stack.push(left * right);
      } else if (token.type == TokenType.divide) {
        final right = stack.pop();
        final left = stack.pop();
        stack.push(left / right);
      } else if (token.type == TokenType.power) {
        final right = stack.pop();
        final left = stack.pop();
        stack.push(pow(left, right));
      }
    }
    return stack.pop();
  }
}