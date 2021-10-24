import 'deque.dart';
import 'exceptions.dart';

class DoublyLinkedList<E extends Object> implements Deque<E> {
  DoublyLinkedList();
  //Преобразованиe List<E> в список
  DoublyLinkedList.fromList(List<E> list) {
    for (final element in list) {
      var node = _Node<E>(data: element);
      _insertBefore(_head, node);
    }
  }

  final _Node<E> _head = _Node<E>.head();

  int _length = 0;

  bool get isEmpty => _length == 0;

  //Получение размера списка
  int get length => _length;

  void _insertBefore(_Node<E> element, _Node<E> newElement) {
    newElement.previous = element.previous;
    newElement.next = element;
    element.previous?.next = newElement;
    element.previous = newElement;
    _length += 1;
  }

  void _insertAfter(_Node<E> element, _Node<E> newElement) {
    newElement.next = element.next;
    newElement.previous = element;
    element.next?.previous = newElement;
    element.next = newElement;
    _length += 1;
  }

  void _insertFirst(_Node<E> element) {
    element.previous = _head;
    element.next = _head.next;
    _head.next?.previous = element;
    _head.next = element;
    _length += 1;
  }

  void _insertLast(_Node<E> element) {
    element.previous = _head.previous;
    element.next = _head;
    _head.previous?.next = element;
    _head.previous = element;
    _length += 1;
  }

  _Node<E>? _nodeAt(int index) {
    if (index < 0 || index >= length) {
      throw IndexError(index, this);
    }
    var tempNode = _head.next;
    var position = 0;
    while (tempNode != _head && position < index) {
      tempNode = tempNode?.next;
      position += 1;
    }
    return tempNode;
  }

  //Вставка в произвольное место по индексу
  void insertAt(int index, E data) {
    final newElement = _Node<E>(data: data);

    if (index == 0) {
      _insertFirst(newElement);
      return;
    }

    if (index == length) {
      _insertLast(newElement);
    } else if (index < length) {
      final nodeBefore = _nodeAt(index - 1);
      if (nodeBefore != null) {
        _insertAfter(nodeBefore, newElement);
      } else {
        throw 'node before was null';
      }
    } else {
      throw IndexError(index, this);
    }
  }

  //Удаление по индексу
  void deleteAt(int index) {
    if (index < 0 || index > length - 1) {
      throw IndexError(index, this);
    }
    var foundNode = _nodeAt(index);
    foundNode?.previous?.next = foundNode.next;
    foundNode?.next?.previous = foundNode.previous;
    _length -= 1;
  }

  //Получения по индексу
  E elementAt(int index) {
    final foundNode = _nodeAt(index);
    if (foundNode != null) {
      final data = foundNode.data!;
      return data;
    }
    throw 'Element wasn\'t found';
  }

  //Обновления по индексу
  void updateAt(int index, E newData) {
    final foundNode = _nodeAt(index);

    foundNode?.data = newData;
  }

  void printAllElements() {
    var tempNode = _head.next;
    while (tempNode != _head) {
      print('${tempNode?.data}');
      tempNode = tempNode?.next;
    }
  }

  List<E> toList() {
    var list = <E>[];
    var tempNode = _head.next;
    while (tempNode != _head) {
      list.add(tempNode!.data!);
      tempNode = tempNode.next;
    }

    return list;
  }

  @override
  void addFirst(E obj) {
    _insertFirst(_Node<E>(data: obj));
  }

  @override
  void addLast(E obj) {
    _insertLast(_Node<E>(data: obj));
  }

  @override
  E getFirst() {
    if (isEmpty) {
      throw NoSuchElementException();
    }
    return elementAt(0);
  }

  @override
  E getLast() {
    if (isEmpty) {
      throw NoSuchElementException();
    }
    return elementAt(length - 1);
  }

  @override
  bool offerFirst(E obj) {
    final element = _Node<E>(data: obj);
    _insertFirst(element);
    return true;
  }

  @override
  bool offerLast(E obj) {
    final element = _Node<E>(data: obj);
    _insertFirst(element);
    return true;
  }

  @override
  E? peekFirst() {
    E? element;
    if (!isEmpty) {
      element = elementAt(0);
    }
    return element;
  }

  @override
  E? peekLast() {
    E? element;
    if (!isEmpty) {
      element = elementAt(length - 1);
    }
    return element;
  }

  @override
  E? pollFirst() {
    E? element;
    if (!isEmpty) {
      element = elementAt(0);
      deleteAt(0);
      _length -= 1;
    }
    return element;
  }

  @override
  E? pollLast() {
    E? element;
    if (!isEmpty) {
      element = elementAt(length - 1);
      deleteAt(length - 1);
      _length -= 1;
    }
    return element;
  }

  @override
  E pop() {
    if (isEmpty) {
      throw NoSuchElementException();
    }
    E element = elementAt(0);
    deleteAt(0);
    _length -= 1;
    return element;
  }

  @override
  void push(E obj) {
    _insertFirst(_Node<E>(data: obj));
  }

  @override
  E removeFirst() {
    if (isEmpty) {
      throw NoSuchElementException();
    }
    E element = elementAt(0);
    deleteAt(0);
    _length -= 1;
    return element;
  }

  @override
  bool removeFirstOccurrence(Object obj) {
    var tempNode = _head.next;
    var isFound = false;
    while (tempNode != _head && !isFound) {
      if (tempNode?.data == obj) {
        isFound = true;
      }
      tempNode = tempNode?.next;
    }
    if (isFound) {
      tempNode?.previous?.next = tempNode.next;
      tempNode?.next?.previous = tempNode.previous;
      _length -= 1;
    }
    return isFound;
  }

  @override
  E removeLast() {
    if (isEmpty) {
      throw NoSuchElementException();
    }
    E element = elementAt(length - 1);
    deleteAt(length - 1);
    _length -= 1;
    return element;
  }

  @override
  bool removeLastOccurrence(Object obj) {
    var tempNode = _head.previous;
    var isFound = false;
    while (tempNode != _head && !isFound) {
      if (tempNode?.data == obj) {
        isFound = true;
      }
      tempNode = tempNode?.previous;
    }
    if (isFound) {
      tempNode?.previous?.next = tempNode.next;
      tempNode?.next?.previous = tempNode.previous;
      _length -= 1;
    }
    return isFound;
  }
}

class _Node<T> {
  _Node({
    required this.data,
    this.previous,
    this.next,
  });
  _Node.head() {
    previous = this;
    next = this;
  }

  T? data;
  _Node<T>? previous;
  _Node<T>? next;

  @override
  String toString() {
    return data.toString();
  }
}
