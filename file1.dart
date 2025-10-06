class Node {
  int? data;
  Node? next;
  Node? prev;
  Node(this.data);
}

class CircularLinkedList {
  Node? head;
  void addAtBeginnig(int data) {
    Node newNode = Node(data);
    if (head == null) {
      newNode.next = head;
      head = newNode;
      return;
    }
    Node temp = head!;
    while (temp.next != head) {
      temp = temp.next!;
    }
    temp.next = newNode;
    newNode.next = head;
    head = newNode;
  }

  //add value after a value
  void addValueAfterValue(int searchValue, int newValue) {
    if (head == null) {
      print("list is empty ");
      return;
    }
    Node newNode = Node(newValue);
    Node temp = head!;
    do {
      if (temp.data == searchValue) {
        newNode.next = temp.next;
        temp.next = newNode;
        return;
      }
      temp = temp.next!;
    } while (temp != head);
    print('Value :$searchValue not found in the search');
  }
}

void main() {}
