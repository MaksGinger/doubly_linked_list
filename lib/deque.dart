abstract class Deque<E> {
  void addFirst(E obj);

  void addLast(E obj);

  E getFirst();

  E getLast();

  bool offerFirst(E obj);

  bool offerLast(E obj);

  E pop();

  void push(E obj);

  E? peekFirst();

  E? peekLast();

  E? pollFirst();

  E? pollLast();

  E removeLast();

  E removeFirst();

  bool removeLastOccurrence(Object obj);

  bool removeFirstOccurrence(Object obj);
}
