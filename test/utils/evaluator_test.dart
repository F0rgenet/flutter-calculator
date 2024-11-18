import 'package:calculator/core/utils/evaluator.dart';

import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Evaluator", () {
    test("should evaluate expression", () {
      final evaluator = Evaluator();
      expect(evaluator.evaluate("1 + 2 * 3"), 7);
    });
    test("should evaluate expression with parenthesis", () {
      final evaluator = Evaluator();
      expect(evaluator.evaluate("3+4*(2-1)"), 7);
    });
    test("should evaluate expression with order", () {
      final evaluator = Evaluator();
      expect(evaluator.evaluate("2+2*2"), 6);
    });
    test("should evaluate expression with power", () {
      final evaluator = Evaluator();
      expect(evaluator.evaluate("2^3^2"), 512);
    });
  });
}