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
        return this;
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
        return this;
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


    reverse(){
        let runner = this.head;
        let temp = null;

        while(runner != null){
            temp = runner.prev;
            runner.prev = runner.next;
            runner.next = temp;
            runner = runner.prev;
        }

        if (temp != null) {
            this.head = temp.prev;
        }
    }
    // reverse(){
    //     //create a variable that we can use to iterate through the list (runner) and start it at the head 
    //     let runner = this.head
    //     //set the head to be where the tail is 
    //     this.head = this.tail
    //     //set the tail to point to the runner 
    //     this.tail = runner
    //     //While runner is point to the node
    //     while(runner!= null){
    //         //create a temp variable pointing to runner.next
    //         let temp = runner.next
    //         // set runner.next to equal to runner.prev
    //         runner.next = runner.prev
    //         //set runner.prev to equal to temp next
    //         runner.prev = temp 
    //         //set runner to equal to the temp next 
    //         runner = temp
    //     }
}


let dll1 = new DLL();
dll1.addToFront(5).addToFront(6).addToFront(7).addToBack(2);
dll1.display();

dll1.reverse();

dll1.display();

// console.log(dll1.length)