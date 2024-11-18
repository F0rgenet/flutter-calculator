import 'dart:collection';

import 'package:calculator/core/models/token.dart';
import 'package:calculator/core/utils/parser.dart';
import 'package:calculator/core/utils/tokenizer.dart';

import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Parser", () {
    test("should return correct postfix expression", () {
      const expression = "3+4*(2-1)";

      final tokenizer = Tokenizer();
      final infixExpression = tokenizer.tokenize(expression);
      final parser = Parser();
      Queue<Token> infixExpressionQueue = Queue<Token>.from(infixExpression);
      final postfixExpression = parser.getPostfixExpression(infixExpressionQueue);
      expect(postfixExpression, [
        Token(TokenType.number, "3"),
        Token(TokenType.number, "4"),
        Token(TokenType.number, "2"),
        Token(TokenType.number, "1"),
        Token(TokenType.minus, "-"),
        Token(TokenType.multiply, "*"),
        Token(TokenType.plus, "+"),
      ]);
    });
    test("should return correct postfix expression with order", () {
      const expression = "2+2*2";

      final tokenizer = Tokenizer();
      final infixExpression = tokenizer.tokenize(expression);
      final parser = Parser();
      Queue<Token> infixExpressionQueue = Queue<Token>.from(infixExpression);
      final postfixExpression = parser.getPostfixExpression(infixExpressionQueue);
      expect(postfixExpression, [
        Token(TokenType.number, "2"),
        Token(TokenType.number, "2"),
        Token(TokenType.number, "2"),
        Token(TokenType.multiply, "*"),
        Token(TokenType.plus, "+"),
      ]);
    });
    test("should return correct postfix expression with parenthesis", () {
      const expression = "3 + 4 * 2 / ( 1 - 5 ) ^ 2 ^ 3";

      final tokenizer = Tokenizer();
      final infixExpression = tokenizer.tokenize(expression);
      final parser = Parser();
      Queue<Token> infixExpressionQueue = Queue<Token>.from(infixExpression);
      final postfixExpression = parser.getPostfixExpression(infixExpressionQueue);
      // 3 4 2 × 1 5 − 2 3 ^ ^ ÷ +
      expect(postfixExpression, [
        Token(TokenType.number, "3"),
        Token(TokenType.number, "4"),
        Token(TokenType.number, "2"),
        Token(TokenType.multiply, "*"),
        Token(TokenType.number, "1"),
        Token(TokenType.number, "5"),
        Token(TokenType.minus, "-"),
        Token(TokenType.number, "2"),
        Token(TokenType.number, "3"),
        Token(TokenType.power, "^"),
        Token(TokenType.power, "^"),
        Token(TokenType.divide, "/"),
        Token(TokenType.plus, "+"),
      ]);
    });
  });
}