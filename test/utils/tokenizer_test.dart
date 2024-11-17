import 'package:calculator/utils/tokenizer.dart';
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
  });
}