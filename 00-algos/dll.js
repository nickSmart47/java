class Node {
    constructor(valueInput) {
        this.value = valueInput;
        this.next = null;
        this.prev = null;
    }
}


class DLL {
    constructor() {
        this.head = null;
        this.tail = null;
    }

    addToBack(valueInput) {
        let newNode = new Node(valueInput);
        if (this.head == null) {
            this.head = newNode;
            this.tail = newNode;
        }
        else {
            this.tail.next = newNode;
            newNode.prev = this.tail;
            this.tail = newNode;
        }
        return this;
    }

    addToFront(valueInput) {
        let newNode = new Node(valueInput);
        if (this.head == null && this.tail == null) {
            this.head = newNode;
            this.tail = newNode;
        }

        else {
            newNode.next = this.head;
            this.head.prev = newNode;
            this.head = newNode;
        }
        return this;
    }

    removeFromBack() {
        if (this.tail == null) {
            return;
        }

        else if (this.head == this.tail) {
            this.head = null;
            this.tail == null;
            return;
        }
        else {

            let newNode = this.tail.prev;
            this.tail = newNode;
            this.tail.next = null;
        }
    }

    removeFromFront() {
        if (this.head == null) {
            return;
        }
        else if (this.head == this.tail) {
            this.head = null;
            this.tail == null;
            return;
        }
        else {
            let newNode = this.head.next;
            this.head = newNode;
            this.head.prev = null;
        }
    }



    display() {
        let result = "";

        //use runner to traverse the SLL
        let runner = this.head;
        while (runner != null) { //while runner is pointing at a node
            result += `${runner.value} --> `
            runner = runner.next //this is how you increment runner to go to the next node
        }

        console.log(result)
    }


}


let dll1 = new DLL();
dll1.addToFront(5);
dll1.addToFront(6);
dll1.addToFront(7);
dll1.addToBack(8);
dll1.addToBack(9);
dll1.addToBack(10);
dll1.removeFromBack();
dll1.removeFromFront();
dll1.removeFromBack();
dll1.removeFromBack();
dll1.removeFromBack();

dll1.removeFromFront();

dll1.removeFromFront();





dll1.display();