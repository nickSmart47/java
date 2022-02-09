//given an array, remove duplicate values from it. Do it in place (do not create a new array)
// you can use an object to keep track of values

const removeDupes = (arr) => {
    let arrObj = {};

    for(let i = 0; i < arr.length; i++){
        // console.log("current value at index " + i +" is " + arr[i] )
        if (!(arr[i] in arrObj)){
            arrObj[arr[i]] = 1;
        }
        else if (arr[i] in arrObj){
            // console.log("value", arr[i], "is a duplicate, removing it now");
            arr.splice(i, 1)
            i--;
        }
    }
    // console.log(arrObj);
}

arr = [3,6,7,3,2,7,7,9,0,1];
removeDupes(arr);
console.log(arr);