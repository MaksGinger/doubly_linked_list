import 'package:doubly_linked_list/doubly_linked_list.dart';

void main(List<String> arguments) {
  try {
    final linkedList = DoublyLinkedList<int>();
    linkedList.insertAt(0, 0);
    linkedList.insertAt(1, 1);
    linkedList.insertAt(2, 2);
    linkedList.insertAt(3, 3);
    linkedList.insertAt(4, 4);
    print('List:');
    linkedList.printAllElements();
    final length = linkedList.length;
    print('length is $length');
    final elem = linkedList.elementAt(3);
    print('element at 3 is $elem');
    linkedList.deleteAt(2);
    print('List without element at index 2:');
    linkedList.printAllElements();
    print('length is ${linkedList.length}');
    //linkedList.elementAt(4); Error
    //linkedList.deleteAt(-1); Error
    linkedList.deleteAt(3);
    print('list without last element:');
    linkedList.printAllElements();
    //linkedList.insertAt(5, 5); Error
    linkedList.insertAt(3, 3);
    print('');
    linkedList.printAllElements();
    linkedList.updateAt(3, 4);
    print('');
    linkedList.printAllElements();
    linkedList.insertAt(2, 2);
    print('');
    linkedList.printAllElements();
    print('\n\n\n\n\n');

    final list = <String>[
      'Ben',
      'Tom',
      'Ivan',
      'Ken',
      'Well',
    ];
    final linkedList2 = DoublyLinkedList.fromList(list);
    linkedList2.printAllElements();
    linkedList2.deleteAt(0);
    print('');
    linkedList2.printAllElements();

    print('\n\n\n\n\n');
    final box1 = Box(height: 1, width: 2);
    final box2 = Box(height: 4, width: 5);
    final linkedList3 = DoublyLinkedList<Box>();
    linkedList3.insertAt(0, box1);
    linkedList3.insertAt(1, box2);
    linkedList3.printAllElements();

    print('\n\n');
    final list2 = linkedList2.toList();
    print(list2.runtimeType);
    list2.forEach(print);
  } catch (e) {
    print(e);
  }
}

class Box {
  const Box({required this.height, required this.width});
  final int height;
  final int width;

  @override
  String toString() {
    return 'Box $height $width';
  }
}
