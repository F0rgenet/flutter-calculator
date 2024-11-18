import 'package:calculator/core/models/token.dart';

class Tokenizer {
  String input = "";
  int position = 0;

  Token readNumber() {
    int start = position;

    while (position < input.length && _isDigit(input[position])) {
      position++;
    }

    return Token(TokenType.number, input.substring(start, position));
  }

  bool _isDigit(String character) {
    return character.codeUnitAt(0) >= 48 && character.codeUnitAt(0) <= 57;
  }

  Token nextToken() {
    if (position >= input.length) {
      return Token(TokenType.endOfInput, "");
    }

    if (input[position] == " ") {
      position++;
      return Token(TokenType.whitespace, " ");
    }

    String literal = input[position];

    if (_isDigit(literal)) {
      return readNumber();
    }

    TokenType type;
    switch (literal) {
      case "+":
        type = TokenType.plus;
        break;
      case "-":
        type = TokenType.minus;
        break;
      case "*":
        type = TokenType.multiply;
        break;
      case "/":
        type = TokenType.divide;
        break;
      case "^":
        type = TokenType.power;
        break;
      case "(":
        type = TokenType.leftParenthesis;
        break;
      case ")":
        type = TokenType.rightParenthesis;
        break;
      default:
        type = TokenType.illegal;
        break;
    }

    position++;
    return Token(type, literal);
  }

  List<Token> tokenize(String input) {
    position = 0;
    this.input = input;
    final List<Token> tokens = [];
    while (position < input.length) {
      Token token = nextToken();
      if (token.type == TokenType.illegal) {
        throw Exception("Invalid token: '${token.literal}'");
      }
      if (token.type == TokenType.whitespace) {
        continue;
      }
      tokens.add(token);
    }
    return tokens;
  }
}
