let x = [2, 4, 5, 7, 8, 12, 22, 24, 27, 45, 55, 56, 58, 66, 67, 68, 90, 100];


//create  a function that accepts an array and a value to search for. It will return true if value is found in input array. False if it isnt. Use binary search strategy
//pick a point in the middle of array and compare the value to find with the value in middle
//if the value to find is greater than the value in middle, we know to look to the right of the middle point
//repeat this process until the value is found or until the array has been fully looked through
function binarySearch(arr, value) {
    let middle = Math.floor(arr.length / 2);

    if (arr.length === 1 && arr[0] != value) {
        return false;
    }
    else if (arr[middle] == value) {
        return true;
    }
    else if (value > arr[middle]) {
        return binarySearch(arr.slice(middle), value)
    }
    else if (value < arr[middle]) {
        return binarySearch(arr.slice(0, middle), value)
    }
}


console.log(binarySearch(x, 68)); //true
console.log(binarySearch(x, 51)); //false