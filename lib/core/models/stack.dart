class Stack<Type> {
  final List<Type> _items = [];

  void push(Type item) {
    _items.add(item);
  }

  Type pop() {
    return _items.removeLast();
  }

  bool get isEmpty {
    return _items.isEmpty;
  }

  bool get isNotEmpty {
    return _items.isNotEmpty;
  }

  Type peek() {
    return _items.last;
  }

  @override
  String toString() {
    return _items.toString();
  }
}