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
      head = newNode;
      newNode.next = head;

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

  //add value it lat
  void addAtLast(int data) {
    Node newNode = Node(data);
    if (head == null) {
      head = newNode;
      newNode.next = head;

      return;
    }
    Node temp = head!;
    while (temp.next != head) {
      temp = temp.next!;
    }
    temp.next = newNode;
    newNode.next = head;
  }

  //now i will do some function for the deletion
  void deleteAtFirst() {
    if (head == null) {
      print("List is empty");
      return;
    }
    if (head!.next == head) {
      head = null;
      return;
    }
    Node temp = head!;
    while (temp.next != head) {
      temp = temp.next!;
    }
    temp.next = head!.next;
    head = head!.next;
  }

  //remove a value from the circular linked list
  void removeValue(int data) {
    if (head == null) {
      return print("The list is empty ");
    }
    //if the head data is equal to data
    if (head!.data == data) {
      //if there is only one data in the list
      if (head!.next == head) {
        head = null;
        return print("$data deleted (list is now empty)");
      }
      Node? last = head;
      while (last!.next != head) {
        last = last.next;
      }
      last.next = head!.next;
      head = head!.next;
      return print("deleted $data from the first node");
    }

    Node? temp = head;
    do {
      if (temp!.next!.data == data) {
        temp.next = temp.next!.next;
        return;
      }
      temp = temp.next;
    } while (temp != head);
    print("$data not found in the list ");
  }

  //delete last node
  void deleteAtLast() {
    if (head == null) {
      return print("List is empty");
    }
    if (head!.next == head) {
      head = null;
      return;
    }
    Node temp = head!;
    while (temp.next!.next != head) {
      temp = temp.next!;
    }

    Node lastNode = temp.next!;
    temp.next = head;
  }

  //searching a value in the circular linked list
  void searchValue(int searchData) {
    if (head == null) {
      return print("List is empty");
    }
    Node? temp = head;
    do {
      if (temp!.data == searchData) {
        print("Value:$searchData find in the list");
        return;
      }
      temp = temp.next!;
    } while (temp != head);
    print("There is no value:$searchData in the linked list ");
  }

  //update value in the linked list
  void updataValue(int oldValue, int newValue) {
    if (head == null) {
      print("List is empty");
      return;
    }

    Node? temp = head;
    do {
      if (temp!.data == oldValue) {
        temp.data = newValue;
        print("value updated from $oldValue to $newValue");
        return;
      }
      temp = temp.next;
    } while (temp != head);
    print("Value $oldValue not found in the list ");
  }

  //find the lenght of the circular linked list
  void lenghtOfList() {
    if (head == null) {
      print("List is empty");
      return;
    }
    int count = 0;
    Node? temp = head;
    do {
      count++;
      temp = temp!.next;
    } while (temp != head);

    print(count);
  }

  //showing the linked list
  List showLinkedList() {
    Node temp = head!;
    List<int> showList = [];

    do {
      showList.add(temp.data!);
      temp = temp.next!;
    } while (temp != head);
    return showList;
  }
}

void main() {
  CircularLinkedList a = CircularLinkedList();
  a.addAtBeginnig(40);
  a.addAtBeginnig(4);
  a.addAtBeginnig(20);
  a.addAtBeginnig(50);
  a.addAtBeginnig(210);
  a.addValueAfterValue(50, 10);
  a.addAtLast(90);
  a.updataValue(50, 1);
  // a.deleteAtFirst();
  // a.deleteAtLast();
  a.removeValue(210);
  a.searchValue(200);
  a.searchValue(20);
  print(a.showLinkedList());
  a.lenghtOfList();
}
