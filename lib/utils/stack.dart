class Stack<Type> {
  final List<Type> _items = [];

  void push(Type item) {
    _items.add(item);
  }

  Type pop() {
    return _items.removeLast();
  }

  bool isEmpty() {
    return _items.isEmpty;
  }

  @override
  String toString() {
    return _items.toString();
  }
}