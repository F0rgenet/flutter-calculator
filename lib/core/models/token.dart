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
  whitespace,
  illegal
}

class Operator {
  final TokenType type;
  final int precedence;
  final bool isLeftAssociative;

  const Operator._({
    required this.type,
    required this.precedence,
    required this.isLeftAssociative,
  });

  static const Map<TokenType, Operator> operators = {
    TokenType.plus: Operator._(
      type: TokenType.plus,
      precedence: 1,
      isLeftAssociative: true,
    ),
    TokenType.minus: Operator._(
      type: TokenType.minus,
      precedence: 1,
      isLeftAssociative: true,
    ),
    TokenType.multiply: Operator._(
      type: TokenType.multiply,
      precedence: 2,
      isLeftAssociative: true,
    ),
    TokenType.divide: Operator._(
      type: TokenType.divide,
      precedence: 2,
      isLeftAssociative: true,
    ),
    TokenType.power: Operator._(
      type: TokenType.power,
      precedence: 3,
      isLeftAssociative: false,
    ),
  };

  static Operator? fromType(TokenType type) => operators[type];
}

extension TokenTypeExtension on TokenType {
  bool get isOperator => Operator.operators.containsKey(this);

  Operator? get operator => Operator.fromType(this);

  int get precedence => operator?.precedence ?? 0;
}

class Token {
  TokenType type;
  String literal;

  Token(this.type, this.literal);

  Operator? get operator => type.operator;

  @override
  String toString() {
    return "$type: $literal";
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Token && other.type == type && other.literal == literal;
  }

  @override
  int get hashCode => type.hashCode ^ literal.hashCode;
}