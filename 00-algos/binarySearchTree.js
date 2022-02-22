class Node {
    constructor(valueInput) {
        this.value = valueInput;
        this.left = null;
        this.right = null;
    }
}


class BST {
    constructor() {
        this.root = null;
    }


    insert(valueInput) {
        //create a node with the value input and insert it into the tree using the rules of a bst
        let newNode = new Node(valueInput);

        if (this.root == null) {
            this.root = newNode;
            return this;
        }

        let current = this.root;

        while (current != null) {
            console.log("current is", current);
            if (newNode.value > current.value) {
                if (current.right == null) {
                    current.right = newNode;
                    return this;
                }
                else{
                    current = current.right;
                }

            }
            else {
                if (current.left == null) {
                    current.left = newNode;
                    return this;
                }
                else{
                    current = current.left;
                }
            }

        }

        return this;

    }


}


let bst1 = new BST()

bst1.insert(5).insert(8).insert(2).insert(4).insert(76).insert(-2)




console.log(bst1)