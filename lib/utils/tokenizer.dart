enum TokenType {
  number,
  plus,
  minus,
  multiply,
  divide,
  power,
  leftParenthesis,
  rightParenthesis,
  endOfInput,
  illegal
}

class Token {
  TokenType type;
  String literal;

  Token(this.type, this.literal);
}

class Tokenizer {
  String input = "";
  int position = 0;

  static const Map<TokenType, int> _precedence = {
    TokenType.plus: 1,
    TokenType.minus: 1,
    TokenType.multiply: 2,
    TokenType.divide: 2,
    TokenType.power: 3,
  };

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

  int getPrecedence(TokenType type) {
    return _precedence[type] ?? 0;
  }
}