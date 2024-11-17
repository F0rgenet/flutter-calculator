import 'dart:collection';

import 'package:calculator/utils/stack.dart';
import 'package:calculator/utils/tokenizer.dart';

// Shunting-yard algorithm

class Parser {
  Parser(this.tokenizer);

  final Tokenizer tokenizer;

  List<Token> getPostfixExpression(List<Token> infixExpression) {
    final Queue<Token> output = Queue<Token>();
    final Stack<Token> operators = Stack<Token>();

    while (infixExpression.isNotEmpty) {

    }
  }
}