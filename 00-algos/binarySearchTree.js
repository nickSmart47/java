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
            // console.log("current is", current);
            if (newNode.value > current.value) {
                if (current.right == null) {
                    current.right = newNode;
                    return this;
                }
                else {
                    current = current.right;
                }

            }
            else {
                if (current.left == null) {
                    current.left = newNode;
                    return this;
                }
                else {
                    current = current.left;
                }
            }

        }

        return this;

    }

    findMin() {
        let current = this.root;
        while (current.left != null) {
            current = current.left;
        }
        return current.value;
    }

    findMax() {
        let current = this.root;
        while (current.right != null) {
            current = current.right;
        }
        return current.value;
    }

    // findMax() {
    //     return this.right?this.right.findMax():this.value;
    // }
    // findMin() {
    //     return this.left?this.left.findMin():this.value;
    // }

    contains(valToFind) {
        let valueFound = false;
        let current = this.root;

        while (current != null) {
            if (current.value == valToFind) {
                valueFound = true;
                break;
            }
            else if (valToFind > current.value) {
                current = current.right;
            }
            else {
                current = current.left;
            }
        }
        return valueFound;
    }

    getHeight(currentNode = this.root, count = 0) {

        //base case is when we know exactly what to return
        if (currentNode == null) {
            return count;
        } else {
            //recursively go through all the nodes
            let max = Math.max(this.getHeight(currentNode.left, count + 1), this.getHeight(currentNode.right, count + 1));
            return max;
        }
    }

    maxHeight(n=this.root) {
        //one line solution!
        return n == null ? 0 : 1 + Math.max(this.maxHeight(n.left), this.maxHeight(n.right));

    }

}


let bst1 = new BST()

bst1.insert(5).insert(8).insert(2).insert(4).insert(76).insert(-2).insert(-23).insert(108)




console.log(bst1);
// console.log(bst1.findMin());
// console.log(bst1.findMax());

// console.log(bst1.contains(108))
console.log(bst1.maxHeight())
console.log(bst1.getHeight())


