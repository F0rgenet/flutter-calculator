import 'dart:collection';
import 'package:calculator/core/models/token.dart';
import '../models/stack.dart';

class Parser {
  List<Token> getPostfixExpression(Queue<Token> infixExpression) {
    final Queue<Token> output = Queue<Token>();
    final Stack<Token> operators = Stack<Token>();

    while (infixExpression.isNotEmpty) {
      final token = infixExpression.removeFirst();

      if (!token.type.isOperator &&
          token.type != TokenType.leftParenthesis &&
          token.type != TokenType.rightParenthesis) {
        output.add(token);
      } else if (token.type.isOperator) {
        while (operators.isNotEmpty &&
            operators.peek().type.isOperator &&
            shouldPopOperator(operators.peek(), token)) {
          output.add(operators.pop());
        }
        operators.push(token);
      } else if (token.type == TokenType.leftParenthesis) {
        operators.push(token);
      } else if (token.type == TokenType.rightParenthesis) {
        while (operators.isNotEmpty &&
            operators.peek().type != TokenType.leftParenthesis) {
          output.add(operators.pop());
        }
        if (operators.isNotEmpty &&
            operators.peek().type == TokenType.leftParenthesis) {
          operators.pop();
        }
      }
    }

    while (operators.isNotEmpty) {
      final token = operators.pop();
      if (token.type != TokenType.leftParenthesis &&
          token.type != TokenType.rightParenthesis) {
        output.add(token);
      }
    }

    return output.toList();
  }

  bool shouldPopOperator(Token top, Token current) {
    final o1 = current.operator;
    final o2 = top.operator;

    if (o1 == null || o2 == null) return false;

    return o2.precedence > o1.precedence ||
        (o2.precedence == o1.precedence && o1.isLeftAssociative);
  }
}