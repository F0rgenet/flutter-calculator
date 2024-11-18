import 'package:calculator/core/utils/tokenizer.dart';
import 'package:calculator/core/models/token.dart';

import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Tokenizer", () {
    test("should return end of input token", () {
      final tokenizer = Tokenizer();
      tokenizer.input = "";
      final token = tokenizer.nextToken();
      expect(token.type, TokenType.endOfInput);
    });

    test("should return number token", () {
      final tokenizer = Tokenizer();
      tokenizer.input = "123";
      final token = tokenizer.nextToken();
      expect(token.type, TokenType.number);
      expect(token.literal, "123");
    });

    test("should return plus token", () {
      final tokenizer = Tokenizer();
      tokenizer.input = "+";
      final token = tokenizer.nextToken();
      expect(token.type, TokenType.plus);
      expect(token.literal, "+");
    });

    test("should return minus token", () {
      final tokenizer = Tokenizer();
      tokenizer.input = "-";
      final token = tokenizer.nextToken();
      expect(token.type, TokenType.minus);
      expect(token.literal, "-");
    });

    test("should return multiply token", () {
      final tokenizer = Tokenizer();
      tokenizer.input = "*";
      final token = tokenizer.nextToken();
      expect(token.type, TokenType.multiply);
      expect(token.literal, "*");
    });

    test("should return divide token", () {
      final tokenizer = Tokenizer();
      tokenizer.input = "/";
      final token = tokenizer.nextToken();
      expect(token.type, TokenType.divide);
      expect(token.literal, "/");
    });

    test("should return power token", () {
      final tokenizer = Tokenizer();
      tokenizer.input = "^";
      final token = tokenizer.nextToken();
      expect(token.type, TokenType.power);
      expect(token.literal, "^");
    });

    test("should return left parenthesis token", () {
      final tokenizer = Tokenizer();
      tokenizer.input = "(";
      final token = tokenizer.nextToken();
      expect(token.type, TokenType.leftParenthesis);
      expect(token.literal, "(");
    });

    test("should return right parenthesis token", () {
      final tokenizer = Tokenizer();
      tokenizer.input = ")";
      final token = tokenizer.nextToken();
      expect(token.type, TokenType.rightParenthesis);
      expect(token.literal, ")");
    });

    test("should return illegal token", () {
      final tokenizer = Tokenizer();
      tokenizer.input = "a";
      final token = tokenizer.nextToken();
      expect(token.type, TokenType.illegal);
      expect(token.literal, "a");
    });

    test("should return tokens", () {
      final tokenizer = Tokenizer();
      final tokens = tokenizer.tokenize("1 + 2* (3^ 4)    / 2");
      expect(tokens, [
        Token(TokenType.number, "1"),
        Token(TokenType.plus, "+"),
        Token(TokenType.number, "2"),
        Token(TokenType.multiply, "*"),
        Token(TokenType.leftParenthesis, "("),
        Token(TokenType.number, "3"),
        Token(TokenType.power, "^"),
        Token(TokenType.number, "4"),
        Token(TokenType.rightParenthesis, ")"),
        Token(TokenType.divide, "/"),
        Token(TokenType.number, "2"),
      ]);
    });

    test("should return single token", () {
      final tokenizer = Tokenizer();
      final tokens = tokenizer.tokenize("1");
      expect(tokens, [
        Token(TokenType.number, "1"),
      ]);
    });
    test("should return single tokens", () {
      final tokenizer = Tokenizer();
      final tokens = tokenizer.tokenize("+");
      expect(tokens, [
        Token(TokenType.plus, "+"),
      ]);
      final tokens2 = tokenizer.tokenize("-");
      expect(tokens2, [
        Token(TokenType.minus, "-"),
      ]);
    }
    );
  });
}